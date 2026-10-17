## Resistor selection
To improve matching, two series resistors are used instead of one longer resistor for 2R. This ensures that R and "2R" (R + R) are similarly affected by variations.

We want to select R large enough such that the Ron of the switches are small in comparison. However, R will affect output resistance, which in turn affects settling time (depending on the output capacitance as well)

The following paper provides formulas for calculating input/output impedances, depending on whether the DAC is segmented or not and depending on whether it's used in current mode or voltage mode: D. Marche and Y. Savaria, "Modeling $R{-}2R$  Segmented-Ladder DACs," in IEEE Transactions on Circuits and Systems I: Regular Papers, vol. 57, no. 1, pp. 31-43, Jan. 2010, doi: 10.1109/TCSI.2009.2019396.
