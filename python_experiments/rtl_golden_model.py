from modulate_if import *
from ModulationParams import *

class MSKGoldenModel:

    def __init__(self, params):
        self.params = params
        self.phase = 0
        self.delay_en = 0

        self.P = params.k + params.j
        self.phase_mask = (1 << self.P) - 1

        self.lut = cosine_lut(params)

    def reset(self):
        self.phase = 0
        self.delay_en = 0

    def get_output(self):
        # Same as phase[k+j-1:j] in Verilog
        address = self.phase >> self.params.j
        address &= (1 << self.params.k) - 1

        return int(self.lut[address])

    def tick(self, enable, sample, rst_n):
        if not rst_n:
            self.reset()
            return

        old_delay_en = self.delay_en

        # Nonblocking assignment behavior:
        # delay_en <= enable
        self.delay_en = int(enable)

        if old_delay_en and enable:
            increment = sample_to_phase(sample, self.params)

            # P-bit phase accumulator wraps around
            self.phase = (self.phase + increment) & self.phase_mask