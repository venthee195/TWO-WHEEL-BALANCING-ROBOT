
%Va=voltage applied to motors for controlling the pendulum
%State Space Equation
%Pre-calculated to simplify the matrix
%Denominator for the A and B matrice
syms v x x_dot teta teta_dot g r Mw Mp Iw Ip L Km Ke R


beta=(2*Mw+(2*Iw/r^2)+Mp);
alpha=(Ip*beta+2*Mp*L^2*(Mw+Iw/r^2));
a22=(2*Km*Ke*(Mp*L*r-Ip-Mp*L^2))/(R*r^2*alpha);
a23=(Mp^2*g*L^2)/alpha;
a42=(2*Km*Ke*(r*beta-Mp*L))/(R*r^2*alpha);
a43=(Mp*g*L*beta)/alpha;
b2=(2*Km*(Ip+Mp*L^2-Mp*L*r))/(R*r*alpha);
b4=(2*Km*(Mp*L-r*beta)/(R*r*alpha));
A=[0,1,0,0;
0,a22,a23,0;
0,0,0,1;
0,a42,a43,0];
b=[0;b2;0;b4];
b1=[0;b2*v;0;b4*v];
t=[x;x_dot;teta;teta_dot];
T=A*t+b1

