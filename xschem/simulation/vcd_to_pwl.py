
from vcdvcd import VCDVCD


def get_signal_transitions(vcd, signal):
    """
    Extract transitions from either:
      - 1-bit signal
      - individual bit of bus

    Returns (timestamp, bit_value) pairs
    """

    bus_name, bit_index = signal

    tv = vcd[bus_name].tv
    transitions = []

    for timestamp, value in tv:

        value = str(value).lower()

        if any(bit in value for bit in "xz"):
            raise ValueError(
                f"Unknown value {value} in {bus_name} "
                f"at timestamp {timestamp}"
            )

        bus_value = int(value, 2)

        if bit_index is None:
            bit_value = bus_value
        else:
            bit_value = (bus_value >> bit_index) & 1

        if bit_value not in (0, 1):
            raise ValueError(
                f"{bus_name} is not a 1-bit signal or valid bus tap"
            )

        transitions.append((timestamp, bit_value))

    return transitions


def vcd_to_spice(
    vcd_file,
    signals,
    output_file,
    vdd=3.3,
):
    """
    Convert individual VCD signals and bus taps into SPICE PWL sources.

    signals is a dictionary:
        SPICE node name: (VCD signal name, bit index)

    Use bit_index=None for individual 1-bit signals.
    """

    vcd = VCDVCD(vcd_file, store_tvs=True)

    # VCD timestamp resolution in seconds.
    tick_seconds = float(vcd.timescale["factor"])

    with open(output_file, "w") as f:

        f.write("* Generated from Cocotb VCD\n\n")

        for spice_name, signal in signals.items():

            transitions = get_signal_transitions(vcd, signal)

            if not transitions:
                raise ValueError(
                    f"No transitions found for {spice_name}"
                )

            f.write(f"* Signal: {spice_name}\n")
            f.write(f"V{spice_name} {spice_name} 0 PWL(\n")

            for timestamp, bit_value in transitions:

                t = float(timestamp) * tick_seconds
                voltage = vdd * bit_value

                f.write(
                    f"+ {t:.12e} {voltage:.6f}\n"
                )

            f.write(")\n\n")


if __name__ == "__main__":

    signals = {
        "clk": ("tb.clk", None),
        "rst_n": ("tb.rst_n", None),
        "in": ("tb.ui_in[7:0]", 0),
        "enable": ("tb.ui_in[7:0]", 1),
    }

    vcd_to_spice(
        vcd_file="../../test/tb.vcd",
        signals=signals,
        output_file="modulator_5_3_stimuli.spice",
        vdd=3.3,
    )
