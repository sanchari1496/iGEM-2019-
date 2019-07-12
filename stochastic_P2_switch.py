#### Phage P2 switch stochastic modelling ####

#### 2019-06-26 ####

# Importing packages #

import matplotlib.pyplot as plt
import stochpy

# Starting stochastic simulations #

smod = stochpy.SSA(IsInteractive=False)
smod.Model("stochastic_P2_switch.psc", dir='/Users/MAC-AIR/Desktop/stochastic')
smod.Method("TauLeaping")
smod.DoStochSim()
smod.PlotSpeciesTimeSeries()
stochpy.plt.savefig('stochpy_plot.pdf')
