g=9.81; %Gravity(m/s^2)
 r=0.051; %Radius of wheel(m)
 Mw=0.03; %Mass of wheel(kg)
 Mp= 1.13; %Mass of body(kg)
 Iw=0.000039; %Inertia of the wheel(kg*m^2)
 Ip=0.0041; %Inertia of the body(kg*m^2)
 l=0.07; %Length to the body's centre of mass(m)

 %Motor's variables
 Km = 0.006123; %Motor torque constant (Nm/A)
 Ke = 0.0069203; %Back EMF constant (Vs/rad)
 R = 3; %Nominal Terminal Resistance (Ohm)

% Va = voltage applied to motors for controlling the pendulum

%%%%%%%%%%%
% System Matrices
%%%%%%%%%%%
%pre-calculated to simplyfy the matrix
%Denominator for the A and B matrices
beta = (2*Mw+(2*Iw/r^2)+Mp);
alpha = (Ip*beta + 2*Mp*l^2*(Mw + Iw/r^2));
A = [0 1 0 0;
 0 (2*Km*Ke*(Mp*l*r-Ip-Mp*l^2))/(R*r^2*alpha) (Mp^2*g*l^2)/alpha 0;
 0 0 0 1;
 0 (2*Km*Ke*(r*beta - Mp*l))/(R*r^2*alpha) (Mp*g*l*beta)/alpha 0]

 B = [ 0;
 (2*Km*(Ip + Mp*l^2 - Mp*l*r))/(R*r*alpha);
 0;
 (2*Km*(Mp*l-r*beta)/(R*r*alpha))]

 C = [1 0 0 0;
 0 0 1 0]
D = [0;
 0] 
x = 1000; y =5000;
Q = [x 0 0 0;
 0 1 0 0;
 0 0 y 0;
 0 0 0 1];
 R =1;
 K=lqr(A,B,Q,R)
