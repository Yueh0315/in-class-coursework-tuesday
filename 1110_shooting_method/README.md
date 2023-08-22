# 11/10 shooting_method

Since `ode45`can only use to solve initial value problems of ODE, we need to find another way to solve boundary value problems of ODE.

Take Fisher-KPP equation: $y''+y-y^2=0,\ y(0)=1,\ y(8)=0$

Denote $y_1=y,\ y_2=y'$, then we get:

```math
y'_1 = y_2,
\\y'_2 = -y_1+y^2_1
```

**Shooting method:** Let $y_1(0)=\alpha$, then we can use `ode45` to solve the problem and see when $y_1(8)=0$.

That is, let $f(\alpha) = y_1(8)=\beta$, solve the equation $f(\alpha)=0$.

It can be combined of **Root_finding_violence.m** in order to find the root.

**Result:**

```
>> shooting_method
a = 
  -0.014873648654778  -0.001077653534481
```

<img src="https://imgur.com/bPWtNXF.jpg" alt="Image" style="zoom:80%;" />

