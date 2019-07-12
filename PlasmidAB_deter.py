#!/usr/bin/env python
# coding: utf-8

# In[5]:


#### Plasmid AB modeling ####

#### 2019-06-19 ####

# Importing packages #

import matplotlib.pyplot as plt

# EXPLICIT EULER SCHEME #

# Setting up initial conditions and parameters #

K1=1
K2=1
K3=1
K4=1
K5=1


Kd=1
Ke=1
Kf=1
Kg=1
Kh=1
Ki=1
Kj=1
Kk=1

Kt=1
Kt1=1
Kt2=1
Kt3=1
Kt4=1
Kt5=1


alpha=1
beta=1
gamma=1
A=1 #arabinose concentration

dt=0.01
t=0.00
x=0.5
m=0.5
p=0.5

# Print initial conditions to screen #

print (t, x, m, p)

# Compute the values of x(t) and m(t) for t<1.0 in a step of 0.01 so in total 100 values #

t_list=list()
x_list=list()
m_list=list()
p_list=list()

while t<10.0:
    den = 1.0 + K1*Kd*x*x + K2*Kf*m*m*m* + K1*K3*Kd*Kd*x*x*x*x + Kg*K2*Kf*Kf*m*m*m*m*m*m*m*m + Kh*Kf*m*m*m*m + Ki*A + Kj*Ke*Ki*A*p*p + Kk*Kj*Ki*Ke*Ke*A*p*p*p*p
    num1=Kt+Kt5*Kj*Ke*Ki*A*A*p*p
    fx= num1/den -alpha*x
    num2= Kt1*Kt2*K1*Kd*x*x + Kt3*K2*Kf*m*m*m*m 
    fm=num2/den - beta*m
    num3= Kt4*Ki*A
    fp=num3/den - gamma*p
    x = x + dt*fx
    m = m + dt*fm
    p = p + dt*fp
    t = t + dt
    t_list.append(t)
    x_list.append(x)
    m_list.append(m)
    p_list.append(p)


# Plot c, cox and tetR protein dynamics over time #

fig = plt.figure()
plt.axis([0,10,0,0.6])
plt.scatter (t_list,x_list, s=1)
plt.scatter (t_list,m_list, s=1)
plt.scatter (t_list,p_list, s=1)
plt.legend (("C protein", "Cox protein", "TetR protein"))
plt.title ("C, Cox and TetR protein dynamics over time in plasmid AB")
plt.xlabel ("Time")
plt.ylabel ("Protein concentration")
plt.show()

# Plot f(x) over x, f(m) over x and f(r) over x in order to find the number of steady states #
# The number of times f(x) and f(m) cross horizontal axis reflects the number of steady states and the exact concentration of the steady state #

x=0
m=0
p=0
dx=0.001
dm=0.001
dp=0.001
x_list=list()
m_list=list()
p_list=list()
fx_list=list()
fm_list=list()
fp_list=list()

while x<5:
    den = 1.0 + K1*Kd*x*x + K2*Kf*m*m*m* + K1*K3*Kd*Kd*x*x*x*x + Kg*K2*Kf*Kf*m*m*m*m*m*m*m*m + Kh*Kf*m*m*m*m + Ki*A + Kj*Ke*Ki*A*p*p + Kk*Kj*Ki*Ke*Ke*A*p*p*p*p
    num1=Kt+Kt5*Kj*Ke*Ki*A*A*p*p
    fx= num1/den -alpha*x
    num2= Kt1*Kt2*K1*Kd*x*x + Kt3*K2*Kf*m*m*m*m 
    fm=num2/den - beta*m
    num3= Kt4*Ki*A
    fp=num3/den - gamma*p
    x=x+dx
    x_list.append(x)
    fx_list.append(fx)
    m=m+dm
    m_list.append(m)
    fm_list.append(fm)
    p=p+dp
    p_list.append(p)
    fp_list.append(fp)


fig = plt.figure()
plt.axis([0,5,-5,5])
plt.scatter (x_list,fx_list,s=1)
plt.scatter (m_list,fm_list,s=1)
plt.scatter (p_list,fp_list,s=1)
plt.legend (("C protein", "Cox protein", "TetR protein"))
plt.axhline(y=0, color='r', linestyle=':')
plt.title ("Steady state analysis in plasmid AB")
plt.xlabel ("Protein concentration")
plt.ylabel ("dx/dt")
plt.show()


# In[ ]: