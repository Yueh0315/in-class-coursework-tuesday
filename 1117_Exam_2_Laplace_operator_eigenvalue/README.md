# 11/17 Exam2: Laplace_operator_eigenvalue

Laplace operator in 2D: $L(u)=u_{xx}+u_{yy},\ x\in [0,1],\ y\in [0,1]$

Discrete Laplace operator as
```math
L(u) = \frac{u_{k-1,l}-2u_{k,l}+u{k+1,l}}{(\Delta x)^2}+\frac{u_{k,l-1}-2u_{k,l}+u{k,l+1}}{(\Delta y)^2}
```
where $u_{k,l}=u(x_k,y_l)$, and assume that $u(x,y)=0$ on the boundary of [0,1]x[0,1]

Then we can use power method to obtain the biggest eigenvalue.

**Power method:** (References: 11/13 Poisson’s equation in 2D)

1. Choose a random u
2. Let $||u||=1$ and $v=L(U)$, denote $\lambda=v(1,1)/u(1,1)$
3. Let u = v and repeat step2. until $\lambda$ converge

**Result:**

```
>> Laplace_operator_eigenvalue
the biggest eigenvalue = 
    -7.821451920098862e+04
```

