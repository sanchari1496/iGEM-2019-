m3 = sbiomodel('Plasmid_B')
r1 = addreaction(m3, 'x -> null') % Degradation of C protein
r2 = addreaction(m3, 'D0 + P -> D0 + P + x') % Synthesis of C protein
r3 = addreaction(m3, 'D0 + A <-> D1') %Arabinose Binding 
r4 = addreaction(m3, 'D1 + P -> D1 + P + m + q') % Cox and TetR synthesis
r5 = addreaction(m3, 'q -> null') % Degradation of TetR
r6 = addreaction(m3, 'm -> null') % Degradation of Cox protein
r7 = addreaction(m3, 'q + q <-> s') % Dimerisation of TetR
r8 = addreaction(m3, 'D1 + s <-> D2') % Binding of TetR2 to D1
r9 = addreaction(m3, 'D2 + P -> D2 + P + x') % Slow Synthesis of C protein
r10 = addreaction(m3, 'D2 + s <-> D3') % Inhibition of C synthesis 



m3.species
m3.species(1).InitialAmount = 0.5
m3.species(2).InitialAmount = 0.25
m3.species(3).InitialAmount = 0.5
m3.species(4).InitialAmount = 0.5
m3.species(5).InitialAmount = 0
m3.species(6).InitialAmount = 0.5
m3.species(7).InitialAmount = 0.5
m3.species(8).InitialAmount = 0
m3.species(9).InitialAmount =0 
m3.species(10).InitialAmount = 0


kineticLaw1 = addkineticlaw(r1,'MassAction')
kineticLaw2 = addkineticlaw(r2,'MassAction')
kineticLaw3 = addkineticlaw(r3,'MassAction')
kineticLaw4 = addkineticlaw(r4,'MassAction')
kineticLaw5 = addkineticlaw(r5,'MassAction')
kineticLaw6 = addkineticlaw(r6,'MassAction')
kineticLaw7 = addkineticlaw(r7,'MassAction')
kineticLaw8 = addkineticlaw(r8,'MassAction')
kineticLaw9 = addkineticlaw(r9,'MassAction')
kineticLaw10 = addkineticlaw(r10,'MassAction')



p1 = addparameter(kineticLaw1,'k0')
p2 = addparameter(kineticLaw2,'kt')
p3 = addparameter(kineticLaw3,'k4','Value',1)
p3r = addparameter(kineticLaw3,'k5','Value',1)
p4 = addparameter(kineticLaw4,'kt1')
p5 = addparameter(kineticLaw5,'k3')
p6 = addparameter(kineticLaw6,'k10')
p7 = addparameter(kineticLaw7,'k1','Value',1)
p7r = addparameter(kineticLaw7,'k2','Value',1)
p8 = addparameter(kineticLaw8,'k6','Value',1)
p8r = addparameter(kineticLaw8,'k7','Value',1)
p9 = addparameter(kineticLaw9,'kt2')
p10 = addparameter(kineticLaw10,'k8','Value',1)
p10r = addparameter(kineticLaw10,'k9','Value',1)

p1.Value=1
p2.Value=10
p4.Value=5
p5.Value=1
p6.Value=1
p9.Value=5


kineticLaw1.ParameterVariableNames = 'k0'
kineticLaw2.ParameterVariableNames = 'kt'
kineticLaw3.ParameterVariableNames = {'k4','k5'}
kineticLaw4.ParameterVariableNames = 'kt1'
kineticLaw5.ParameterVariableNames = 'k3'
kineticLaw6.ParameterVariableNames = 'k10'
kineticLaw7.ParameterVariableNames = {'k1','k2'}
kineticLaw8.ParameterVariableNames = {'k6','k7'}
kineticLaw9.ParameterVariableNames = 'kt2'
kineticLaw10.ParameterVariableNames = {'k8','k9'}


sd = sbiosimulate(m3)
y = selectbyname(sd, {'x','m','q'})
sbioplot(y)
title('C,Cox and TetR protein dynamics')
xlabel('Time, units')
ylabel('Protein concentration')
legend('C','Cox','Tetr')

sbmlexport(m3, 'Plasmid_B.xml')
