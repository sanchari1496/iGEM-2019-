m1 = sbiomodel('P2_switch')
r1 = addreaction(m1, 'x -> null') % Degradation of C protein
r2 = addreaction(m1, 'x + x <-> y') % Dimerization of C protein
r3 = addreaction(m1, 'D0 + P -> D0 + P + x') % Synthesis of C protein
r4 = addreaction(m1, 'D0 + y <-> D1') % Binding of C2 to Pc promoter at low concentrations
r5 = addreaction(m1, 'D1 + P -> D1 + P + x') % Stimulated synthesis of C protein
r6 = addreaction(m1, 'D1 + y <-> D2') % Binding of C2 to Pc promoter at high concentrations
m1.species(1).InitialAmount = 0.5
m1.species(2).InitialAmount = 0.5
m1.species(3).InitialAmount = 0
m1.species(4).InitialAmount = 0
m1.species(5).InitialAmount = 0
m1.species(6).InitialAmount = 0
kineticLaw1 = addkineticlaw(r1,'MassAction')
kineticLaw2 = addkineticlaw(r2,'MassAction')
kineticLaw3 = addkineticlaw(r3,'MassAction')
kineticLaw4 = addkineticlaw(r4,'MassAction')
kineticLaw5 = addkineticlaw(r5,'MassAction')
kineticLaw6 = addkineticlaw(r6,'MassAction')
p1 = addparameter(kineticLaw1,'k0')
p2 = addparameter(kineticLaw2,'k12','Value',1000)
p2r = addparameter(kineticLaw2,'k21','Value',1)
p3 = addparameter(kineticLaw3,'kt')
p4 = addparameter(kineticLaw4,'k1','Value',1000)
p4r = addparameter(kineticLaw4,'k11','Value',1)
p5 = addparameter(kineticLaw5,'kt2')
p6 = addparameter(kineticLaw6,'k2','Value',1000)
p6r = addparameter(kineticLaw6,'k22','Value',1)
p1.Value=1
p3.Value=1
p5.Value=1
kineticLaw1.ParameterVariableNames = 'k0'
kineticLaw2.ParameterVariableNames = {'k12','k21'}
kineticLaw3.ParameterVariableNames = 'kt'
kineticLaw4.ParameterVariableNames = {'k1','k11'}
kineticLaw5.ParameterVariableNames = 'kt2';
kineticLaw6.ParameterVariableNames = {'k2','k22'}
sd = sbiosimulate(m1)
x = selectbyname(sd, 'x')
sbioplot(x)