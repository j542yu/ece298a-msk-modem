from ModulationParams import ModulationParams
from graphing import plot_msk_if_sweep
from modulate_if import generate_symbols, modulate_msk

params = ModulationParams()

"""
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
"""

symbols = generate_symbols(params.num_bits, params.seed)

symbols, phase_stream, output = modulate_msk(symbols, params)
