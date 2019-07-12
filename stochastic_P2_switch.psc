Modelname: P2_switch_model
Description: P2 bacteriphage lysogenic-lytic cycle P2_switch
Species_In_Conc: True
Output_In_Conc: False

UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: item, 1.0, 0, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: minute, 1.0, 0, 100

#Reactions
R1: 
	x > $pool
	k0*x
R2: 
    {2.0}x > x2
     k12*x
R3: 
     x2 > {2.0}x 
     k21*x2

R4: 
	D0+P > D0+P+x
	kt*D0*P

R5: 
 	D0+x2 > D1
 	k1*D0*x2

R6: 
	D1 > D0 + x2
	k2*D1
     
R7: 
	D1 + P > D1+P+x
	kt1*D1*P

R8:
     D1 + x2 > D2
     k3*D1*x2
R9:
     D2 > D1+x2
     k4*D2

# Variable Species

x=50
x = 50
x2 = 10
D0 = 25
D1 = 0
D2 = 0
P = 5

# Parameter initialisations
k0 = 0.01
k12= 1
k21= 1
kt = 0.01
k1= 1
k2 = 10
kt1 = 10
k3 = 1
k4 = 10
