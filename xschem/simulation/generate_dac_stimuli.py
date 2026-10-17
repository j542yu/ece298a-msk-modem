from pathlib import Path

# DAC stimulus parameters
V_LOW = 0.0
V_HIGH = 1.8
DWELL = 1e-6         # Time per DAC code: 0.5 us
EDGE = 1e-9            # Transition ramp: 1 ns
NUM_R2R_BITS = 8
NUM_THERM_BITS = 0

OUTPUT = Path(f"dac_stimuli_{DWELL*1e6}us_{NUM_R2R_BITS}_{NUM_THERM_BITS}.spice")


def dac_inputs_seg(code):
    """Return input levels, ordered B[0:NUM_R2R_BITS], then T[0:2^NUM_THERM_BITS - 1]."""
    # For binary R-2R inputs
    binary = [(code >> i) & 1 for i in range(NUM_R2R_BITS)]

    # For 0 through 2^NUM_THERM_BITS - 1 thermometer elements
    upper = code >> NUM_R2R_BITS
    thermometer = [int(upper > j) for j in range(2**NUM_THERM_BITS - 1)]

    return binary + thermometer


def spice_voltage(value):
    return V_HIGH if value else V_LOW


def generate_source(name, node, bit_index):
    """Generate a PWL source for one DAC input."""
    points = [(0.0, spice_voltage(dac_inputs_seg(0)[bit_index]))]

    for code in range(1, 256):
        new_value = spice_voltage(dac_inputs_seg(code)[bit_index])
        old_value = spice_voltage(dac_inputs_seg(code - 1)[bit_index])

        # Hold the previous value until just before the next code,
        # then ramp to the new value over EDGE seconds.
        points.append((code * DWELL - EDGE, old_value))
        points.append((code * DWELL, new_value))

    # Keep the final code stable through the end of the simulation.
    points.append((256 * DWELL, spice_voltage(dac_inputs_seg(255)[bit_index])))

    pwl = " ".join(
        f"{time:.12g} {voltage:.6g}"
        for time, voltage in points
    )

    return f"{name} {node} GND PWL({pwl})"


lines = [
    "* Automatically generated 8-bit DAC stimuli",
    "* Code sweep: 0 to 255",
    "* B inputs are binary; T inputs are thermometer encoded",
    "",
]

# Drive B[0]-B[NUM_R2R_BITS - 1].
for i in range(NUM_R2R_BITS):
    if NUM_THERM_BITS != 0:
        lines.append(
            generate_source(f"V{i+1}", f"B[{i}]", i)
        )
    else:
        lines.append(
            generate_source(f"V{i+1}", f"B_R[{i}]", i)
        )

# Drive T[0]-T[(2^NUM_THERM_BITS - 1) - 1].
for j in range(2**NUM_THERM_BITS - 1):
    lines.append(
        generate_source(f"V{j+1+NUM_R2R_BITS}", f"T[{j}]", j + NUM_R2R_BITS)
    )

OUTPUT.write_text("\n".join(lines) + "\n")
print(f"Wrote {OUTPUT.resolve()}")

