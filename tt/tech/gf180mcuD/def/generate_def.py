import argparse
import re
from pathlib import Path

import yaml


# ============================================================
# General configuration
# ============================================================

DEF_UNITS = 2000  # DEF database units per micron

DESIGN_NAME = "tt_um_transmit_5_3"

SCRIPT_DIR = Path(__file__).resolve().parent
TILE_SIZES_FILE = SCRIPT_DIR.parent / "tile_sizes.yaml"

TILE_NAME = "custom"

TT_DIR = SCRIPT_DIR.parent.parent.parent.parent
OUTPUT_FILE =  "tt_block_custom_pgvdd.def"

PIN_LAYER = "Metal4"

# Default pin dimensions in microns:
# (width along edge, depth perpendicular to edge)
DEFAULT_PIN_SIZE = {
    "top":    (0.3, 1.0),
    "bottom": (0.3, 1.0),
    "left":   (1.0, 0.3),
    "right":  (1.0, 0.3),
}

# The left/right defaults above are overridden below:
# For vertical edges, the pin is 1.0 um wide and 0.3 um tall.


# ============================================================
# Pin configuration
# ============================================================

# Pin names support bus notation:
#   "B[4:0]" expands to B[4], B[3], ..., B[0]
#
# Each pin has a direction:
#   INPUT, OUTPUT, INOUT
#
# Pins are placed in the order specified here.

PINS = {
    "top": [
        {"name": "clk",    "direction": "INPUT"},
        {"name": "rst_n",  "direction": "INPUT"},
        {"name": "in",     "direction": "INPUT"},
        {"name": "enable", "direction": "INPUT"},
    ],

    "bottom": [],

    "left": [
        {"name": "T[6:0]", "direction": "OUTPUT"},
        {"name": "B[4:0]", "direction": "OUTPUT"},
    ],

    "right": [],
}


# Per-side placement configuration.
#
# alignment:
#   top/bottom: left or right
#   left/right: bottom or top
#
# spacing: distance between pin centers, in microns.
#
# clearance: distance between the die boundary and the
#            nearest edge of the first pin, in microns.

SIDE_CONFIG = {
    "top": {
        "alignment": "right",
        "spacing": 2.76,
        "clearance": 8,
        "size": (0.3, 1.0),
    },

    "bottom": {
        "alignment": "right",
        "spacing": 2.76,
        "clearance": 8,
        "size": (0.3, 1.0),
    },

    "left": {
        "alignment": "top",
        "spacing": 2.76,
        "clearance": 8,
        "size": (1.0, 0.3),
    },

    "right": {
        "alignment": "top",
        "spacing": 2.76,
        "clearance": 8,
        "size": (1.0, 0.3),
    },
}


# ============================================================
# DEF formatting helpers
# ============================================================

def to_def_units(value_um):
    """Convert microns to integer DEF database units."""
    return round(value_um * DEF_UNITS)


def fmt(value):
    """Format a number for DEF output."""
    return str(int(value))


# ============================================================
# Tile size extraction
# ============================================================

def read_tile_size(filename, tile_name):
    """
    Read tile dimensions from tile_sizes.yaml.

    Expected format:
        custom: "0 0 160 100"

    Returns:
        width_um, height_um
    """

    with open(filename, "r") as f:
        tile_sizes = yaml.safe_load(f)

    if tile_name not in tile_sizes:
        raise ValueError(
            f"Tile '{tile_name}' not found in {filename}. "
            f"Available tiles: {list(tile_sizes.keys())}"
        )

    coordinates = tile_sizes[tile_name]

    if isinstance(coordinates, str):
        coordinates = coordinates.split()

    if len(coordinates) != 4:
        raise ValueError(
            f"Invalid tile dimensions for '{tile_name}': {coordinates}"
        )

    x1, y1, x2, y2 = map(float, coordinates)

    width_um = x2 - x1
    height_um = y2 - y1

    if width_um <= 0 or height_um <= 0:
        raise ValueError("Die dimensions must be positive.")

    return width_um, height_um


# ============================================================
# Bus expansion
# ============================================================

def expand_pin_name(name):
    """
    Expand bus notation into individual pin names.

    Examples:
        B[4:0] -> B[4], B[3], B[2], B[1], B[0]
        T[0:3] -> T[0], T[1], T[2], T[3]

    Non-bus names are returned unchanged.
    """

    match = re.fullmatch(r"(.*?)\[(-?\d+):(-?\d+)\]", name)

    if not match:
        return [name]

    base = match.group(1)
    start = int(match.group(2))
    end = int(match.group(3))

    step = 1 if end >= start else -1

    return [
        f"{base}[{i}]"
        for i in range(start, end + step, step)
    ]


def expand_pins():
    """
    Expand all buses and return pins grouped by side.

    Each resulting pin is represented by:
        (name, direction)
    """

    expanded = {}

    for side, pins in PINS.items():
        expanded[side] = []

        for pin in pins:
            names = expand_pin_name(pin["name"])

            for name in names:
                expanded[side].append(
                    (name, pin["direction"].upper())
                )

    return expanded


# ============================================================
# Pin placement
# ============================================================

def calculate_pin_positions(
    side,
    pin_count,
    width_um,
    height_um,
):
    """
    Calculate the placement coordinates of all pins on a side.

    Coordinates represent pin geometry centers.

    Clearance is measured from the die boundary to the
    outer edge of the first pin.

    Returns:
        List of (x, y) coordinates in microns.
    """

    if pin_count == 0:
        return []

    config = SIDE_CONFIG[side]

    alignment = config["alignment"].lower()
    spacing = config["spacing"]
    clearance = config["clearance"]

    pin_width, pin_depth = config["size"]

    positions = []

    if side in ("top", "bottom"):

        usable_length = width_um

        # Distance from the die edge to the first pin center.
        start = clearance + pin_width / 2

        if alignment == "left":
            coordinates = [
                start + i * spacing
                for i in range(pin_count)
            ]

        elif alignment == "right":
            coordinates = [
                usable_length - start - i * spacing
                for i in range(pin_count)
            ]

        else:
            raise ValueError(
                f"Invalid alignment '{alignment}' for {side}"
            )

        # Keep the pin geometry centered along the edge.
        if side == "bottom":
            y = pin_depth / 2
        else:
            y = height_um - pin_depth / 2

        positions = [(x, y) for x in coordinates]

    else:

        usable_length = height_um

        start = clearance + pin_depth / 2

        if alignment == "bottom":
            coordinates = [
                start + i * spacing
                for i in range(pin_count)
            ]

        elif alignment == "top":
            coordinates = [
                usable_length - start - i * spacing
                for i in range(pin_count)
            ]

        else:
            raise ValueError(
                f"Invalid alignment '{alignment}' for {side}"
            )

        if side == "left":
            x = pin_width / 2
        else:
            x = width_um - pin_width / 2

        positions = [(x, y) for y in coordinates]

    # Check that all pins fit inside the die boundary
    # along the direction in which they are distributed.
    for x, y in positions:

        if side in ("top", "bottom"):
            if x - pin_width / 2 < 0:
                raise ValueError(f"Pin extends beyond die on {side}")
            if x + pin_width / 2 > width_um:
                raise ValueError(f"Pins do not fit on {side}")

        else:
            if y - pin_depth / 2 < 0:
                raise ValueError(f"Pin extends beyond die on {side}")
            if y + pin_depth / 2 > height_um:
                raise ValueError(f"Pins do not fit on {side}")

    return positions


# ============================================================
# DEF section generation
# ============================================================

def generate_pin_section(expanded_pins, width_um, height_um):

    all_pins = []

    for side in ("top", "bottom", "left", "right"):

        pins = expanded_pins[side]

        if not pins:
            continue

        positions = calculate_pin_positions(
            side,
            len(pins),
            width_um,
            height_um,
        )

        pin_width, pin_depth = SIDE_CONFIG[side]["size"]

        # Convert pin geometry dimensions to DEF units.
        half_width = to_def_units(pin_width / 2)
        half_depth = to_def_units(pin_depth / 2)

        for (name, direction), (x, y) in zip(pins, positions):

            x_def = to_def_units(x)
            y_def = to_def_units(y)

            # Layer geometry is centered around placement coordinate.
            entry = (
                f"    - {name} + NET {name} "
                f"+ DIRECTION {direction} + USE SIGNAL\n"
                f"      + PORT\n"
                f"        + LAYER {PIN_LAYER} "
                f"( -{half_width} -{half_depth} ) "
                f"( {half_width} {half_depth} )\n"
                f"        + PLACED ( {x_def} {y_def} ) N ;"
            )

            all_pins.append(entry)

    output = [f"PINS {len(all_pins)} ;"]
    output.extend(all_pins)
    output.append("END PINS")

    return "\n".join(output)


def generate_specialnets_section():

    return """SPECIALNETS 2 ;
    - VDD + USE POWER ;
    - VSS + USE GROUND ;
END SPECIALNETS"""


def generate_nets_section(expanded_pins):

    # Preserve side order and pin declaration order.
    all_names = []

    for side in ("top", "bottom", "left", "right"):
        for name, _ in expanded_pins[side]:
            all_names.append(name)

    lines = [f"NETS {len(all_names)} ;"]

    for name in all_names:
        lines.append(
            f"    - {name} ( PIN {name} ) + USE SIGNAL ;"
        )

    lines.append("END NETS")

    return "\n".join(lines)


# ============================================================
# Main DEF generator
# ============================================================

def generate_def(design_name, output_file):

    width_um, height_um = read_tile_size(
        TILE_SIZES_FILE,
        TILE_NAME,
    )

    width_def = to_def_units(width_um)
    height_def = to_def_units(height_um)

    expanded_pins = expand_pins()

    pins_section = generate_pin_section(
        expanded_pins,
        width_um,
        height_um,
    )

    specialnets_section = generate_specialnets_section()

    nets_section = generate_nets_section(expanded_pins)

    def_content = f"""VERSION 5.8 ;
DIVIDERCHAR "/" ;
BUSBITCHARS "[]" ;
DESIGN {design_name} ;
UNITS DISTANCE MICRONS {DEF_UNITS} ;
DIEAREA ( 0 0 ) ( {width_def} {height_def} ) ;
COMPONENTS 0 ;
END COMPONENTS
{pins_section}
{specialnets_section}
{nets_section}
END DESIGN
"""

    Path(output_file).write_text(def_content)

    print(f"Generated DEF: {output_file}")
    print(f"Design name:   {design_name}")
    print(f"Die size:      {width_um} x {height_um} um")
    print(f"DEF size:      {width_def} x {height_def}")
    print(f"Pin count:     {sum(len(v) for v in expanded_pins.values())}")


# ============================================================
# Command-line interface
# ============================================================

def main():

    parser = argparse.ArgumentParser(
        description="Generate a custom DEF file."
    )

    parser.add_argument(
        "--design_name",
        default=DESIGN_NAME,
        help="Name of top level verilog",
    )
    parser.add_argument(
        "--output",
        default=OUTPUT_FILE,
        help="Output DEF filename",
    )

    args = parser.parse_args()

    generate_def(
        args.design_name,
        args.output,
    )


if __name__ == "__main__":
    main()
