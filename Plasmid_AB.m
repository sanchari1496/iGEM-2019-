m4 = sbiomodel('Plasmid_AB')
r1 = addreaction(m4, 'x -> null') % Degradation of C protein
r2 = addreaction(m4, 'x + x <-> y') % Dimerization of C protein
r3 = addreaction(m4, 'D0 + P -> D0 + P + x') % Synthesis of C protein
r4 = addreaction(m4, 'D0 + P -> D0 + P + m') % Synthesis of Cox protein
r5 = addreaction(m4, 'm -> null') % Degradation of Cox protein
r6 = addreaction(m4, 'm + m + m + m <-> n') % Tetramerization of Cox protein
r7 = addreaction(m4, 'D0 + y <-> D1') % Binding of C2 to Pe promoter at low concentrations
r8 = addreaction(m4, 'D1 + P -> D1 + P + m') % Slow synthesis of Cox protein due to C dimer
r9 = addreaction(m4, 'D0 + n <-> D2') % Binding of Cox4 to Pe promoter at low concentration 
r10 = addreaction(m4, 'D2 + P -> D2 + P + m') % Slow synthesis of Cox protein due to Cox tetramer
r11 = addreaction(m4, 'D1 + y <-> D3') % Inhibition of Cox synthesis due to dimers of C 
r12 = addreaction(m4, 'D2 + n <-> D4') % Inhibition of Cox synthesis due to tetramer of Cox 
r13 = addreaction(m4, 'D0 + n + y -> D5') % Inhibition of Cox synthesis due to both dimer and tetramer
r14 = addreaction(m4, 'D0 + A <-> D6') % Arabinose Binding 
r15 = addreaction(m4, 'D6 + P -> D6 + P + m + q') % Cox and TetR synthesis
r16 = addreaction(m4, 'q -> null') % Degradation of TetR
r17 = addreaction(m4, 'q + q <-> s') % Dimerisation of TetR
r18 = addreaction(m4, 'D6 + s <-> D7') % Binding of TetR2 at low concentration
r19 = addreaction(m4, 'D7 + P -> D7 + P + x') % Slow Synthesis of C protein
r20 = addreaction(m4, 'D7 + s <-> D8') % Inhibition of C synthesis 




m4.species
m4.species(1).InitialAmount = 0.5
m4.species(2).InitialAmount = 0
m4.species(3).InitialAmount = 0.25
m4.species(4).InitialAmount = 0.5
m4.species(5).InitialAmount = 0.5
m4.species(6).InitialAmount = 0
m4.species(7).InitialAmount = 0
m4.species(8).InitialAmount = 0
m4.species(9).InitialAmount = 0
m4.species(10).InitialAmount = 0
m4.species(11).InitialAmount = 0
m4.species(12).InitialAmount = 0
m4.species(13).InitialAmount = 0.5
m4.species(14).InitialAmount = 0.5
m4.species(15).InitialAmount = 0
m4.species(16).InitialAmount = 0
m4.species(17).InitialAmount = 0


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
kineticLaw16 = addkineticlaw(r16,'MassAction')
kineticLaw17 = addkineticlaw(r17,'MassAction')
kineticLaw18 = addkineticlaw(r18,'MassAction')
kineticLaw19 = addkineticlaw(r19,'MassAction')
kineticLaw20 = addkineticlaw(r20,'MassAction')





p1 = addparameter(kineticLaw1,'k0')
p2 = addparameter(kineticLaw2,'k11','Value',1)
p2r = addparameter(kineticLaw2,'k12','Value',1)
p3 = addparameter(kineticLaw3,'kt')
p4 = addparameter(kineticLaw4,'kt3')
p5 = addparameter(kineticLaw5,'k10')
p6 = addparameter(kineticLaw6,'k13','Value',1)
p6r = addparameter(kineticLaw6,'k14','Value',1)
p7 = addparameter(kineticLaw7,'k15','Value', 1)
p7r = addparameter(kineticLaw7,'k16','Value',1)
p8 = addparameter(kineticLaw8,'kt4')
p9 = addparameter(kineticLaw9,'k17','Value',1)
p9r = addparameter(kineticLaw9,'k18','Value',1)
p10 = addparameter(kineticLaw10,'kt5')
p11 = addparameter(kineticLaw11,'k19','Value',1)
p11r = addparameter(kineticLaw11,'k20','Value',1)
p12 = addparameter(kineticLaw12,'k21','Value',1)
p12r = addparameter(kineticLaw12,'k22','Value',1)
p13 = addparameter(kineticLaw13,'k23')
p14 = addparameter(kineticLaw14,'k4','Value',1)
p14r = addparameter(kineticLaw14,'k5','Value',1)
p15 = addparameter(kineticLaw15,'kt1')
p16 = addparameter(kineticLaw16,'k3')
p17 = addparameter(kineticLaw17,'k1','Value',1)
p17r = addparameter(kineticLaw17,'k2','Value',1)
p18 = addparameter(kineticLaw18,'k6','Value',1)
p18r = addparameter(kineticLaw18,'k7','Value',1)
p19 = addparameter(kineticLaw19,'kt2')
p20 = addparameter(kineticLaw20,'k8','Value',1)
p20r = addparameter(kineticLaw20,'k9','Value',1)

p1.Value=1
p3.Value=1
p4.Value=1
p5.Value=1
p8.Value=1
p10.Value=1
p13.Value=1
p15.Value=1
p16.Value=1
p19.Value=1


kineticLaw1.ParameterVariableNames = 'k0'
kineticLaw2.ParameterVariableNames = {'k11','k12'}
kineticLaw3.ParameterVariableNames = 'kt'
kineticLaw4.ParameterVariableNames = 'kt3'
kineticLaw5.ParameterVariableNames = 'k10'
kineticLaw6.ParameterVariableNames = {'k13','k14'}
kineticLaw7.ParameterVariableNames = {'k15','k16'}
kineticLaw8.ParameterVariableNames = 'kt4'
kineticLaw9.ParameterVariableNames = {'k17','k18'}
kineticLaw10.ParameterVariableNames = 'kt5'
kineticLaw11.ParameterVariableNames = {'k19','k20'}
kineticLaw12.ParameterVariableNames = {'k21','k22'}
kineticLaw13.ParameterVariableNames = 'k23'
kineticLaw14.ParameterVariableNames = {'k4','k5'}
kineticLaw15.ParameterVariableNames = 'kt1'
kineticLaw16.ParameterVariableNames = 'k3'
kineticLaw17.ParameterVariableNames = {'k1','k2'}
kineticLaw18.ParameterVariableNames = {'k6','k7'}
kineticLaw19.ParameterVariableNames = 'kt2'
kineticLaw20.ParameterVariableNames = {'k8','k9'}




sd = sbiosimulate(m4)
z = selectbyname(sd, {'x','m','q'})
sbioplot(z)
title('C,Coxand TetR protein dynamics')
xlabel('Time, units')
ylabel('Protein concentration')
legend('C','Cox','Tetr')

sbmlexport(m4, 'Plasmid_AB.xml')