m2 = sbiomodel('Plasmid_Model')
r1 = addreaction(m2, 'D1 + P -> D1 + P + x') % Synthesis of C protein
r2 = addreaction(m2, 'x -> null') % Degradation of C protein
r3 = addreaction(m3, 'D0 + A <-> D1') %Arabinose Binding
r4 = addreaction(m2, 'x + x <-> y') % Dimerization of C protein
r5 = addreaction(m2, 'D1 + P -> D1 + P + m') % Synthesis of Cox protein
r6 = addreaction(m2, 'm + m + m + m <-> n') % Tetramerization of Cox protein
r7 = addreaction(m2, 'm -> null') % Degradation of Cox protein
r8 = addreaction(m2, 'D1 + y <-> D3') % Binding of C2 to Pe promoter at low concentrations
r9 = addreaction(m2, 'D3 + P -> D3 + P + m') % Slowed synthesis of Cox due to C2 binding
r10 = addreaction(m2, 'D1 + n <-> D2') % Binding of Cox4 to Pe promoter
r11 = addreaction(m2, 'D2 + P  -> D2 + P + m') % Slow synthesis of Cox 
r12= addreaction(m2, 'D3 + y <-> D5') % Binding of C2 to Pe promoter at high concentrations
r13 = addreaction(m2, 'D3 + n <-> D6') % Inhibition of Cox synthesis 
r14 = addreaction(m2, 'D2 + y <-> D6') % Inhibition of Cox when C is bound 
r15 = addreaction(m2, 'D2 + n <-> D4') % Inhibition of C when Cox is bound 



m2.species
m2.species(1).InitialAmount = 0
m2.species(2).InitialAmount = 0.5
m2.species(3).InitialAmount = 0.5
m2.species(4).InitialAmount = 0.25
m2.species(5).InitialAmount = 0.5
m2.species(6).InitialAmount = 0
m2.species(7).InitialAmount = 0.5
m2.species(8).InitialAmount = 0
m2.species(9).InitialAmount = 0
m2.species(10).InitialAmount = 0
m2.species(11).InitialAmount = 0
m2.species(12).InitialAmount = 0
m2.species(13).InitialAmount = 0

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
kineticLaw15 = addkineticlaw(r15,'MassAction')

p1 = addparameter(kineticLaw1,'kt1')
p2 = addparameter(kineticLaw2,'k0')
p3 = addparameter(kineticLaw2,'k1','Value',1)
p3r = addparameter(kineticLaw2,'k2','Value',1)
p4 = addparameter(kineticLaw4,'k4','Value',1)
p4r = addparameter(kineticLaw4,'k5','Value',1)
p5 = addparameter(kineticLaw5,'kt2')
p6 = addparameter(kineticLaw6,'k6','Value',1)
p6r = addparameter(kineticLaw6,'k7','Value',1)
p7 = addparameter(kineticLaw7,'k02')
p8 = addparameter(kineticLaw9,'k8','Value',1)
p8r = addparameter(kineticLaw9,'k9','Value',1)
p9 = addparameter(kineticLaw10,'kt3')
p10 = addparameter(kineticLaw10,'k10','Value',1)
p10r = addparameter(kineticLaw10,'k11','Value',1)
p11 = addparameter(kineticLaw11,'kt4')
p12 = addparameter(kineticLaw12, 'k12','Value',1 )
p12r = addparameter(kineticLaw12, 'k13','Value',1)
p13 = addparameter(kineticLaw13, 'k14','Value',1)
p13r = addparameter(kineticLaw13, 'k15','Value',1)
p14 = addparameter(kineticLaw14, 'k16','Value',1)
p14r = addparameter(kineticLaw14, 'k17','Value',1)
p15 = addparameter(kineticLaw14, 'k18','Value',1)
p15r = addparameter(kineticLaw14, 'k19','Value',1)

p1.Value=10
p2.Value=1
p5.Value=10
p7.Value=1
p9.Value=5
p11.Value=2


kineticLaw1.ParameterVariableNames = 'kt1'
kineticLaw2.ParameterVariableNames = 'k0'
kineticLaw3.ParameterVariableNames = {'k1','k2'}
kineticLaw4.ParameterVariableNames = {'k4','k5'}
kineticLaw5.ParameterVariableNames = 'kt2'
kineticLaw6.ParameterVariableNames = {'k6','k7'}
kineticLaw7.ParameterVariableNames = 'k02'
kineticLaw8.ParameterVariableNames = {'k8','k9'}
kineticLaw9.ParameterVariableNames = 'kt3'
kineticLaw10.ParameterVariableNames = {'k10','k11'}
kineticLaw11.ParameterVariableNames = 'kt4'
kineticLaw12.ParameterVariableNames = {'k12','k13'}
kineticLaw13.ParameterVariableNames = {'k14','k15'}
kineticLaw14.ParameterVariableNames = {'k16','k17'}
kineticLaw15.ParameterVariableNames = {'k18','k19'}

sd = sbiosimulate(m2)
x = selectbyname(sd, {'x','m'})
sbioplot(x)
title('C and Cox protein dynamics')
xlabel('Time, units')
ylabel('Protein concentration')
legend('C','Cox')

sbmlexport(m2, 'Model_plasmid.xml')
