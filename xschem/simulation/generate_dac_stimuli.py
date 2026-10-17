
from pathlib import Path

# DAC stimulus parameters
V_LOW = 0.0
V_HIGH = 1.8
DWELL = 1e-6       # Time per DAC code: 1 us
EDGE = 1e-9        # Transition ramp: 1 ns

OUTPUT = Path("dac_stimuli.spice")


def dac_inputs(code):
    """Return input levels, ordered B[0:4], then T[0:6]."""
    # Five binary R-2R inputs
    binary = [(code >> i) & 1 for i in range(5)]

    # Three upper bits select 0 through 7 thermometer elements
    upper = code >> 5
    thermometer = [int(upper > j) for j in range(7)]

    return binary + thermometer


def spice_voltage(value):
    return V_HIGH if value else V_LOW


def generate_source(name, node, bit_index):
    """Generate a PWL source for one DAC input."""
    points = [(0.0, spice_voltage(dac_inputs(0)[bit_index]))]

    for code in range(1, 256):
        new_value = spice_voltage(dac_inputs(code)[bit_index])
        old_value = spice_voltage(dac_inputs(code - 1)[bit_index])

        # Hold the previous value until just before the next code,
        # then ramp to the new value over EDGE seconds.
        points.append((code * DWELL - EDGE, old_value))
        points.append((code * DWELL, new_value))

    # Keep the final code stable through the end of the simulation.
    points.append((256 * DWELL, spice_voltage(dac_inputs(255)[bit_index])))

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

# V1-V5 drive B[0]-B[4].
for i in range(5):
    lines.append(
        generate_source(f"V{i+1}", f"B[{i}]", i)
    )

# V6-V12 drive T[0]-T[6].
for j in range(7):
    lines.append(
        generate_source(f"V{j+6}", f"T[{j}]", j + 5)
    )

OUTPUT.write_text("\n".join(lines) + "\n")
print(f"Wrote {OUTPUT.resolve()}")

