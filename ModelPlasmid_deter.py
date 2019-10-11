#!/usr/bin/env python
# coding: utf-8

# In[13]:


#### Model Plasmid  modeling ####

#### 2019-06-18 ####

# Importing packages #

import matplotlib.pyplot as plt

# EXPLICIT EULER SCHEME #

# Setting up initial conditions and parameters #

K1=1
K2=1
K3=1
K4=1
K5=1
K6=1
K7=1
KD=1
KT=1
Kt1=10
Kt2=1
Kt3=1
Kt4=1
alpha=1
beta=1
A=5 #arabinose concentration

dt=0.01
x=0.5
t=0.00
m=0.5


# Print initial conditions to screen #

print (t,x,m)

# Compute the values of x(t) and m(t) for t<1.0 in a step of 0.01 so in total 100 values #

t_list=list()
x_list=list()
m_list=list()


while t<10.0:
    den = 1.0 + K1*A + K1*K3*m*m*m*m*A + K1*K2*KD*A*x*x + K7*K3*K5*KT*KT*m*m*m*m*m*m*m*m*A + K4*K2*K1*KD*KD*x*x*x*x*A+K5*K2*K1*KD*x*x*KT*m*m*m*m*A
    fx=Kt1*K1*A/den -alpha*x
    num=Kt2*K1*A + Kt3*K1*K2*KD*x*x*A + Kt4*K1*K3*KT*A*m*m*m*m
    fm=num/den - beta*m
    x = x + dt*fx
    m = m + dt*fm
    t = t + dt
    t_list.append(t)
    x_list.append(x)
    m_list.append(m)
  


# Plot c, cox and tetR protein dynamics over time #

fig = plt.figure()
plt.axis([0,10,0,2])
plt.scatter (t_list,x_list, s=1)
plt.scatter (t_list,m_list, s=1)
plt.legend (("C protein", "Cox protein"))
plt.title ("C, Cox and TetR protein dynamics over time in Model plasmid ")
plt.xlabel ("Time")
plt.ylabel ("Protein concentration")
plt.show()

# Plot f(x) over x, f(m) over x and f(r) over x in order to find the number of steady states #
# The number of times f(x) and f(m) cross horizontal axis reflects the number of steady states and the exact concentration of the steady state #

x=0
m=0
dx=0.001
dm=0.001
x_list=list()
m_list=list()
fx_list=list()
fm_list=list()


while x<5:
    den = 1.0 + K1*A + K1*K3*m*m*m*m*A + K1*K2*KD*A*x*x + K7*K3*K5*KT*KT*m*m*m*m*m*m*m*m*A + K4*K2*K1*KD*KD*x*x*x*x*A+K5*K2*K1*KD*x*x*KT*m*m*m*m*A
    fx= Kt1*K1*A/den -alpha*x
    num=Kt2*K1*A + Kt3*K1*K2*KD*x*x*A + Kt4*K1*K3*KT*A*m*m*m*m
    fm=num/den - beta*m
    x=x+dx
    x_list.append(x)
    fx_list.append(fx)
    m=m+dm
    m_list.append(m)
    fm_list.append(fm)


fig = plt.figure()
plt.axis([0,5,-5,5])
plt.scatter (x_list,fx_list,s=1)
plt.scatter (m_list,fm_list,s=1)
plt.legend (("C protein","Cox protein"))
plt.axhline(y=0, color='r', linestyle=':')
plt.title ("Steady state analysis in Model Plasmid")
plt.xlabel ("Protein concentration")
plt.ylabel ("dx/dt")
plt.show()

