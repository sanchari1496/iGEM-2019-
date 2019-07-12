Modelname: PlasmidAB_model
Description: PlasmidAB_function
Species_In_Conc: True
Output_In_Conc: False

UnitVolume: litre, 1.0, 0, 1
UnitLength: metre, 1.0, 0, 1
UnitSubstance: item, 1.0, 0, 1
UnitArea: metre, 1.0, 0, 2
UnitTime: minute, 1.0, 0, 1

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
 	D0+ q > D6
 	k4*D0*q


R7: 
	D6 > D0 + q
	k5*D6
     

R8: 
	D6 + P > D6+P+m+n
	kt1*D6*P


R9:
     D6 + m2 > D7
     k6*D6*m2


R10:
     D7 > D6+m2
     k7*D7



R11:
    D7+P > D7+P+x
    kt2*D7*P


R12: 
 
    D7 + m2 > D8
    k8*D7*m2


R13:
     D8 > D7+ m2
     k9*D8


R14:
     n > $pool
     k10*n


R15:
 
  {2.0}x > x2
     k11*x
  

R16:

   x2 > {2.0}x
     k12*x2


R17:

    D0+P > D0+P+n
	kt3*D0*P


R18:
    {4.0}n > n4
     k13*n


R19:
     n4 > {4.0}n
     k14*n4



R20:
   D0+x2 > D1
   k15*D0*x2


R21:
    D1 >  D0+x2
    k16*D1


R22:
     D0+n4 > D2
     k17*D0*n4


R23:
    D2 > D0+n4
    k18*D2


R24:
    D1+P > D1+P+n
    kt4*D1*P


R25:
     D2+P > D2+P+n
     kt5*D2*P


R26:
     D1+x2 > D3
     k19*D1*x2


R27: 
     D3> D1 + x2
     k20*D3


R28:
 
   D2 + n4 > D4
   k21*D2*n4


R29:
    
    D4 > D2 + n4
    k22*D4


R30:
    D0+ x2+ n4 > D5
    k23*D0*x2*n4


R31:
    D5> D0+x2+n4
    k24*D5



# Variable Species

x=5
x = 5
x2=0
m=5
m2=0
q=5
n=5
n4=0
D0 = 2
D1 = 0
D2 = 0
D3=0
D4=0
D5=0
D6=0
D7=0
D8=0
P=5

# Parameter initialisations
k0 = 1
k3=1
k10=1
k1=1
k2= 1
k6=1
k7=1
kt = 10
k4= 1
k5 = 10
kt1 = 10
kt2 = 10
kt3 = 10
kt4 = 10
kt5 = 10
k8 = 1
k9 = 10
k11=1
k12=10
k13=1
k14=10
k15=1
k16=10
k17=1
k18=10
k19=1
k20=10
k21=1
k22=10
k23=1
k24=10
