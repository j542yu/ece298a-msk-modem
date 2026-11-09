from pathlib import Path
import math

# F_S is output rate of digital portion of modulator
F_S = 50e6
DWELL = 1 / F_S

# DAC parameters
NUM_R2R_BITS = 6
NUM_THERM_BITS = 2

NUM_BITS = NUM_R2R_BITS + NUM_THERM_BITS
MAX_CODE = (1 << NUM_BITS) - 1

V_HIGH = 3.3
V_LOW = 0

# MSK parameters
F_IF = 2e6

# Samples/symbol in digital portion of modulator
M = 8

# Stimulus parameters
NUM_SYMBOLS = 100
EDGE = 1e-9

# Derived waveform parameters
F_MIN = F_IF - F_S / (4 * M)
F_MAX = F_IF + F_S / (4 * M)

if not (0 < F_MIN < F_MAX < F_S / 2):
    raise ValueError("MSK frequencies must be between DC and Nyquist")

OUTPUT = Path(
    f"dac_sine_sampling-{F_S/1e6}MHz_"
    f"if-{F_IF/1e6}MHz_"
    f"{NUM_R2R_BITS}_{NUM_THERM_BITS}.spice"
)

def dac_inputs_seg(code):
    """Return B inputs followed by thermometer T inputs"""
    binary = [
        (code >> i) & 1
        for i in range(NUM_R2R_BITS)
    ]

    upper = code >> NUM_R2R_BITS
    thermometer = [
        int(upper > j)
        for j in range((1 << NUM_THERM_BITS) - 1)
    ]

    return binary + thermometer


def spice_voltage(value):
    return V_HIGH if value else V_LOW


def generate_sine_codes():
    # Alternate between minimum and maximum MSK frequencies
    phase = 0.0
    codes = []

    for symbol in range(NUM_SYMBOLS):

        # Alternate frequency every symbol
        frequency = F_MIN if symbol % 2 == 0 else F_MAX

        # Constant phase increment throughout this symbol
        phase_increment = 2 * math.pi * frequency / F_S

        for _ in range(M):

            # Convert cosine amplitude into an 8-bit offset-binary code
            code = round(
                MAX_CODE / 2 * (1 + math.cos(phase))
            )

            codes.append(code)

            # Accumulate phase, preserving continuity between symbols
            phase = (phase + phase_increment) % (2 * math.pi)

    return codes


def generate_source(name, node, bit_index, codes):
    """Generate a PWL source for one DAC input"""

    points = [
        (0.0, spice_voltage(dac_inputs_seg(codes[0])[bit_index]))
    ]

    for i in range(1, len(codes)):
        time = i * DWELL

        old_value = spice_voltage(
            dac_inputs_seg(codes[i - 1])[bit_index]
        )
        new_value = spice_voltage(
            dac_inputs_seg(codes[i])[bit_index]
        )

        # Hold the old value until the transition begins
        # EDGE is the duration of the input transition
        if old_value != new_value:
            points.append((time - EDGE, old_value))
            points.append((time, new_value))

    # Keep the final code stable until the simulation ends
    points.append((
        len(codes) * DWELL,
        spice_voltage(dac_inputs_seg(codes[-1])[bit_index])
    ))

    pwl = " ".join(
        f"{time:.12g} {voltage:.6g}"
        for time, voltage in points
    )

    return f"{name} {node} GND PWL({pwl})"


def main():
    if DWELL <= 0:
        raise ValueError("DWELL must be positive")

    if EDGE < 0 or EDGE >= DWELL:
        raise ValueError("EDGE must satisfy 0 <= EDGE < DWELL")

    codes = generate_sine_codes()

    lines = [
        f"* DAC bits: {NUM_BITS}",
        f"* Number of code intervals: {len(codes)}",
        f"* Dwell: {DWELL} s",
        f"* Edge duration: {EDGE} s",
        f"* Simulation duration: {len(codes) * DWELL} s",
        ""
    ]

    print("Enter positive integer for starting numbering of voltage sources")
    V_start_num = int(input())

    # Generate sources for all binary R-2R inputs
    for i in range(NUM_R2R_BITS):
        lines.append(
            generate_source(f"V{V_start_num+i}", f"B_{NUM_R2R_BITS}_{NUM_THERM_BITS}[{i}]", i, codes)
        )

    # Generate sources for all thermometer inputs
    for j in range((1 << NUM_THERM_BITS) - 1):
        lines.append(
            generate_source(
                f"V{V_start_num+j+NUM_R2R_BITS}",
                f"T_{NUM_R2R_BITS}_{NUM_THERM_BITS}[{j}]",
                j + NUM_R2R_BITS,
                codes
            )
        )

    OUTPUT.write_text("\n".join(lines) + "\n")

    print(f"Codes generated: {len(codes)}")
    print(f"Duration: {len(codes) * DWELL:.6g} s")
    print(f"Wrote {OUTPUT.resolve()}")


if __name__ == "__main__":
    main()
