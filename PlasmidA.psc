Modelname: PlasmidA_model
Description: PlasmidA_function
Species_In_Conc: True
Output_In_Conc: False

UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: item, 1.0, 0, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: minute, 1.0, 0, 100

#Reactions
#x=conc of C
#n=conc of Cox

R1: 
	x > $pool
	k0*x

R2: 
    {2.0}x > x2
     k1*x

R3: 
     x2 > {2.0}x
     k2*x2

R4: 
    n> $pool
    k3*n 

R5: 
	D0+P > D0+P+x
	kt*D0*P

R6: 
 	D0+x2 > D1
 	k4*D0*x2

R7: 
	D1 > D0 + x2
	k5*D1
     
R8: 
	D1 + P > D1+P+x
	kt1*D1*P

R9:
     D1 + x2 > D2
     k6*D1*x2

R10:
     D2 > D1+x2
     k7*D2

R11:
    {4.0}n > n4
     k8*n


R12:
     n4 > {4.0}n
     k9*n4

R13:
    D0+P > D0+P+n
    kt2*D0*P

R14: 
 
    D0+n4 > D3 
    k10*D0*n4

R15:
     D3 > D0+n4
     k11*D3

R16:
     D3 + P  > D3+P+n
     kt3*D3*P

R17:
    D3+ n4 > D4
    k12*D3*n4

R18: 
    D4 > D3+n4
    k13*D4

R19:

 D1+ n4 > D5
 k14*D1*n4

R20: 

D5 > D1+n4
k15*D5

R21:

D3 + x2 > D5
k16*D3*x2

R22:

D5 > D3+x2
k17*D5
    

# Variable Species

x=50 
x = 50
x2=0
n4=0
n=50
D0 = 25
D1 = 0
D2 = 0
D3=0
D4=0
D5=0
P = 5

# Parameter initialisations
k0 = 0.01
k3=0.01
k10=1
k11=10
k12=1
k13=10
k14=1
k15=10
k16=1
k17=10
k1= 1
k2= 1
k6=1
k7=10
kt = 0.01
k4= 1
k5 = 10
kt1 = 10
kt2=10
kt3=10
k8=1
k9 = 10
