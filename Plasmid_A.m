m2 = sbiomodel('Plasmid_A')
r1 = addreaction(m2, 'x -> null') % Degradation of C protein
r2 = addreaction(m2, 'x + x <-> y') % Dimerization of C protein
r3 = addreaction(m2, 'D0 + P -> D0 + P + x') % Synthesis of C protein
r4 = addreaction(m2, 'D0 + y <-> D1') % Binding of C2 to Pe promoter at low concentrations
r5 = addreaction(m2, 'D1 + P -> D1 + P + m') % Stimulated synthesis of Cox protein
r6 = addreaction(m2, 'D1 + y <-> D2') % Binding of C2 to Pe promoter at high concentrations
r7 = addreaction(m2, 'D0 + P -> D0 + P + m') % Synthesis of Cox protein
r8 = addreaction(m2, 'm -> null') % Degradation of Cox protein
r9 = addreaction(m2, 'm + m + m + m <-> n') % Tetramerization of Cox protein
r10 = addreaction(m2, 'D0 + n <-> D3') % Binding of Cox4 to Pe promoter
r11 = addreaction(m2, 'D3 + P  -> D3 + P + m') % Slow synthesis of Cox 
r12 = addreaction(m2, 'D3 + n <-> D4') % Inhibition of Cox synthesis 
r13 = addreaction(m2, 'D1 + n <-> D5') % Inhibition of Cox when C is bound 
r14 = addreaction(m2, 'D3 + y <-> D5') % Inhibition of C when Cox is bound 



m2.species
m2.species(1).InitialAmount = 0.5
m2.species(2).InitialAmount = 0
m2.species(3).InitialAmount = 0.25
m2.species(4).InitialAmount = 0.5
m2.species(5).InitialAmount = 0
m2.species(6).InitialAmount = 0
m2.species(7).InitialAmount = 0.5
m2.species(8).InitialAmount = 0
m2.species(9).InitialAmount = 0
m2.species(10).InitialAmount = 0
m2.species(11).InitialAmount = 0

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
kineticLaw11 = addkineticlaw(r11,'MassAction')
kineticLaw12 = addkineticlaw(r12,'MassAction')
kineticLaw13 = addkineticlaw(r13,'MassAction')
kineticLaw14 = addkineticlaw(r14,'MassAction')

p1 = addparameter(kineticLaw1,'k0')
p2 = addparameter(kineticLaw2,'k1','Value',1)
p2r = addparameter(kineticLaw2,'k2','Value',1)
p3 = addparameter(kineticLaw3,'kt')
p4 = addparameter(kineticLaw4,'k4','Value',1)
p4r = addparameter(kineticLaw4,'k5','Value',10)
p5 = addparameter(kineticLaw5,'kt1')
p6 = addparameter(kineticLaw6,'k6','Value',1)
p6r = addparameter(kineticLaw6,'k7','Value',10)
p7 = addparameter(kineticLaw7,'kt2')
p8 = addparameter(kineticLaw8,'k3')
p9 = addparameter(kineticLaw9,'k8','Value',1)
p9r = addparameter(kineticLaw9,'k9','Value',10)
p10 = addparameter(kineticLaw10,'k10','Value',1)
p10r = addparameter(kineticLaw10,'k11','Value',10)
p11 = addparameter(kineticLaw11,'kt3')
p12 = addparameter(kineticLaw12, 'k12','Value',1 )
p12r = addparameter(kineticLaw12, 'k13','Value',10)
p13 = addparameter(kineticLaw13, 'k14','Value',1)
p13r = addparameter(kineticLaw13, 'k15','Value',10)
p14 = addparameter(kineticLaw14, 'k16','Value',1)
p14r = addparameter(kineticLaw14, 'k17','Value',10)

p1.Value=0.1
p3.Value=0.01
p5.Value=10
p7.Value=10
p8.Value=0.01
p11.Value=10


kineticLaw1.ParameterVariableNames = 'k0'
kineticLaw2.ParameterVariableNames = {'k1','k2'}
kineticLaw3.ParameterVariableNames = 'kt'
kineticLaw4.ParameterVariableNames = {'k4','k5'}
kineticLaw5.ParameterVariableNames = 'kt1'
kineticLaw6.ParameterVariableNames = {'k6','k7'}
kineticLaw7.ParameterVariableNames = 'kt2'
kineticLaw8.ParameterVariableNames = 'k3'
kineticLaw9.ParameterVariableNames = {'k8','k9'}
kineticLaw10.ParameterVariableNames = {'k10','k11'}
kineticLaw11.ParameterVariableNames = 'kt3'
kineticLaw12.ParameterVariableNames = {'k12','k13'}
kineticLaw13.ParameterVariableNames = {'k14','k15'}
kineticLaw14.ParameterVariableNames = {'k16','k17'}


sd = sbiosimulate(m2)
x = selectbyname(sd, {'x','m'})
sbioplot(x)
title('C and Cox protein dynamics')
xlabel('Time, units')
ylabel('Protein concentration')
legend('C','Cox')

sbmlexport(m2, 'P2_switch_extended.xml')