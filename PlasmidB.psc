Modelname: PlasmidB_model
Description: PlasmidB_function
Species_In_Conc: True
Output_In_Conc: False

UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: item, 1.0, 0, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: minute, 1.0, 0, 100

#Reactions
#x=conc of C
#m=conc of TetR
#n=conc of Cox
#q=conc of Arabinose
R1: 
	x > $pool
	k0*x

R2: 
    {2.0}m > m2
     k1*m

R3: 
     m2 > {2.0}m
     k2*m2

R4: 
    m > $pool
    k3*m

R5: 
	D0+P > D0+P+x
	kt*D0*P

R6: 
 	D0+q > D1
 	k4*D0*q

R7: 
	D1 > D0 + q
	k5*D1
     
R8: 
	D1 + P > D1+P+m+n
	kt1*D1*P

R9:
     D1 + m2 > D2
     k6*D1*m2

R10:
     D2 > D1+m2
     k7*D2

R11:
    D2+P > D2+P+x
    kt2*D2*P

R12: 
 
    D2+m2 > D3 
    k8*D2*m2

R13:
     D3  > D2+m2
     k9*D3

R14:
     n > $pool
     k10*n

    

# Variable Species

x=0.5
x = 0.5
m=0.5
m2=0
q=5
n=0.5
D0 = 25
D1 = 0
D2 = 0
D3=0
P = 5

# Parameter initialisations
k0 = 1
k3=1
k10=1
k1= 1
k2= 1
k6=1
k7=1
kt = 10
k4= 1
k5 = 1
kt1 = 5
kt2=5
k8=1
k9 = 1
