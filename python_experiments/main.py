from ModulationParams import ModulationParams
from graphing import plot_msk_if_sweep
from modulate_if import rad_to_address

import math

params = ModulationParams()

configurations = [
    {"n": 8, "k": 8, "j": 0},
    {"n": 8, "k": 8, "j": 4},
    {"n": 8, "k": 6, "j": 8},
    {"n": 8, "k": 8, "j": 8},
]

plot_msk_if_sweep(
    base_params=params,
    configurations=configurations,
    num_symbols_to_plot=50,
)

# To determine phase addition from IF:
params = ModulationParams(
    n=8,
    k=8,
    j=8,
    m=8,

    # For f_if/f_s = 0.1
    f_s=50_000_000,
    f_if=5_000_000,
)

if_increment_rad = (
    2 * math.pi * params.f_if / params.f_s
)

print(f"For f_if/f_s == 0.1, IF_OFFSET == {hex(rad_to_address(if_increment_rad, params))}")