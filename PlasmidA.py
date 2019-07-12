#### PlasmidA switch stochastic modelling ####

#### 2019-06-26 ####

# Importing packages #

import matplotlib.pyplot as plt
import stochpy

# Starting stochastic simulations #

smod = stochpy.SSA(IsInteractive=False)
smod.Model("PlasmidA.psc", dir='/Users/MAC-AIR/Desktop/stochastic')
smod.Method("TauLeaping")
smod.DoStochSim()
smod.PlotSpeciesTimeSeries()
stochpy.plt.savefig('stochpyPlasmidA_plot.pdf')