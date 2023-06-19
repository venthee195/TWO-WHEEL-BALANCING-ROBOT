function dx=DynamicModel(t,x,flag,para)
global C M0 F
%Variable initialization
g=9.81; %Gravity(m/s^2)
r=0.051; %Radius of wheel(m)
Mw=0.03; %Mass of wheel(kg)
Mp=1.13; %Mass of body(kg)
Iw=0.000039; %Inertia of the wheel(kg*m^2)
Ip=0.0041; %Inertia of the body(kg*m^2)
L=0.07; %Length to the body's center of mass(m)
%Motor's variables
Km=0.006123; %Motor torque constant(Nm/A)
Ke=0.006087; %Back EMF constant(Vs/rad)
R=3; %Nominal terminal resistance(Ohm)
%Va=voltage applied to motors for controlling the pendulum
%State Space Equation
%Pre-calculated to simplify the matrix
%Denominator for the A and B matrices
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
Cont=[A A*b A^2*b A^3*b];
Rho=rank(Cont);
%Ackermann's formula
u = zeros(size(t));
eig(A)
n1=-1;n2=-2;n3=-3;
C=[0,0,0,1]*inv([b,A*b,A^2*b,A^3*b])*(A-n1*eye(4))*(A-n2*eye(4))*(A-n3*eye(4));
s=C*x;
F=1;
if F==1
    M0=40;
    u=-M0*sign(s);
elseif F==2
    beta=30;
    delta=0;
    u=-beta*(abs(x(1))+abs(x(2))+abs(x(3))+abs(x(4))+delta)*sign(s);
end
%State equation
dx=zeros(4,1);
f0=0.5;
ft=f0*sin(3*t);
dx=A*x+b*(u+ft);