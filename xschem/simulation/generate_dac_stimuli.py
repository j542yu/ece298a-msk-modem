from pathlib import Path
import math

# DAC stimulus parameters
V_LOW = 0.0
V_HIGH = 3.3

DWELL = 1e-6       # Time per DAC code: 1 us
EDGE = 1e-9        # Transition ramp: 1 ns

NUM_R2R_BITS = 8
NUM_THERM_BITS = 0

# Select: "sweep", "sine", "ramp", "triangle", "alternating",
WAVEFORM = "ramp"

# Sine and triangle parameters
SAMPLES_PER_PERIOD = 64
NUM_PERIODS = 4

# Ramp parameter
RAMP_SAMPLES = 256

OUTPUT = Path(
    f"dac_{WAVEFORM}_{DWELL*1e6}us_"
    f"{NUM_R2R_BITS}_{NUM_THERM_BITS}.spice"
)

NUM_BITS = NUM_R2R_BITS + NUM_THERM_BITS
MAX_CODE = (1 << NUM_BITS) - 1


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


def generate_codes():
    """Generate the digital DAC code sequence for the selected waveform"""

    if WAVEFORM == "sweep":
        # Every code exactly once: useful for static linearity tests
        return list(range(MAX_CODE + 1))

    elif WAVEFORM == "sine":
        # Full-scale sine, quantized to integer DAC codes
        # Starts at midscale and repeats NUM_PERIODS times
        count = SAMPLES_PER_PERIOD * NUM_PERIODS
        return [
            round(
                MAX_CODE / 2
                * (1 + math.sin(
                    2 * math.pi * n / SAMPLES_PER_PERIOD
                ))
            )
            for n in range(count)
        ]

    elif WAVEFORM == "ramp":
        # Uniformly spaced codes from zero to full scale
        if RAMP_SAMPLES < 2:
            raise ValueError("RAMP_SAMPLES must be at least 2")

        return [
            round(MAX_CODE * n / (RAMP_SAMPLES - 1))
            for n in range(RAMP_SAMPLES)
        ]

    elif WAVEFORM == "triangle":
        # Repeating linear rise and fall
        count = SAMPLES_PER_PERIOD * NUM_PERIODS
        codes = []

        for n in range(count):
            phase = (n % SAMPLES_PER_PERIOD) / SAMPLES_PER_PERIOD
            value = 1 - abs(2 * phase - 1)
            codes.append(round(MAX_CODE * value))

        return codes

    elif WAVEFORM == "alternating":
        # Repeated major bit-pattern transitions
        # For an 8-bit DAC: 0x55 <-> 0xAA
        return [
            (0x55 & MAX_CODE) if n % 2 == 0
            else (0xAA & MAX_CODE)
            for n in range(32)
        ]

    else:
        raise ValueError(f"Unknown waveform: {WAVEFORM}")


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

    codes = generate_codes()

    lines = [
        f"* Automatically generated DAC stimulus: {WAVEFORM}",
        f"* DAC bits: {NUM_BITS}",
        f"* Number of code intervals: {len(codes)}",
        f"* Dwell: {DWELL} s",
        f"* Edge duration: {EDGE} s",
        f"* Simulation duration: {len(codes) * DWELL} s",
        ""
    ]

    # Generate sources for all binary R-2R inputs
    for i in range(NUM_R2R_BITS):
        lines.append(
            generate_source(f"V{i+1}", f"B[{i}]", i, codes)
        )

    # Generate sources for all thermometer inputs
    for j in range((1 << NUM_THERM_BITS) - 1):
        lines.append(
            generate_source(
                f"V{j+1+NUM_R2R_BITS}",
                f"T[{j}]",
                j + NUM_R2R_BITS,
                codes
            )
        )

    OUTPUT.write_text("\n".join(lines) + "\n")

    print(f"Waveform: {WAVEFORM}")
    print(f"Codes generated: {len(codes)}")
    print(f"Duration: {len(codes) * DWELL:.6g} s")
    print(f"Wrote {OUTPUT.resolve()}")


if __name__ == "__main__":
    main()
