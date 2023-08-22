# 10/20 Exam 1: Root_finding_violence

Compute the roots of function $xsin(x)$ in $[-L,L]$ with violence:

1. Separate the interval into N intervals then use IVT to check if there is a root in the interval

2. Choose a random number in such intervals. We say we find the root if tolerance < $10^{-5}$

**Result:**

```
>> Root_finding_violence(2*pi)
roots = 
  -3.141595592425925
   3.141594429993956
```
