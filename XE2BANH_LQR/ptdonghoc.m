syms x_2dot a1 a2 a3 a4 teta x teta_2dot v b1 b2 b3 x_dot
f1=teta_2dot-(x_2dot*a1+2*a2*x-2*a3*v+teta*a4)
 
f2=x_2dot-(b1*v-b2*x_dot+b3*teta_2dot)
%pt2=x-(b1*v-b2*x
[x2,x4] = solve (f1, f2,'teta_2dot','x_2dot' )
teta_2dot = -(a4*teta - 2*a3*v + 2*a2*x + a1*b1*v - a1*b2*x_dot)/(a1*b3 - 1)
x_2dot=-(b1*v - b2*x_dot + a4*b3*teta - 2*a3*b3*v + 2*a2*b3*x)/(a1*b3 - 1)