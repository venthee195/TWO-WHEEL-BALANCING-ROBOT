g=9.81; %Gravity(m/s^2)
r=0.051; %Radius of wheel(m)
Mw=0.03; %Mass of wheel(kg)
Mp= 1.13; %Mass of body(kg)
Iw=0.000039; %Inertia of the wheel(kg*m^2)
Ip=0.0041; %Inertia of the body(kg*m^2)
l=0.07; %Length to the body's centre of mass(m)
%Motor's variables
Km = 0.006123; %Motor torque constant (Nm/A)
Ke = 0.006087; %Back EMF constant (Vs/rad)
R = 3; %Nominal Terminal Resistance (Ohm)
% Va = voltage applied to motors for controlling the pendulum
%%%%%%%%%%%%%
% System Matrices
%%%%%%%%%%%%%
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
C = [1 0 0 0;0 0 1 0]
D = [0;0]
%Obtaining the eigenvalues of the system matrix
disp('The eigenvalues of the system matrix A')
disp('A positive value will indicate an unstable system')
p = eig(A)
%%%%%%%%%%%%%%%
%LQR control design
%%%%%%%%%%%%%%%
disp('Designing the optimal controller')
disp('Q = C''*C is a 4 x 4 weighting matrix for the outputs')
disp('Q could well be Identity matrix with size same with system matrix A, as long as it is positivedefinite')
disp('R is a 1 x 1 weighting matrix for the input')
%x is the weighting for the cart position
%y is the weighting for the pendulum position
x = 1000; y =5000;
Q = [x 0 0 0;
0 1 0 0;
0 0 y 0;
0 0 0 1];
R =1;
BRinverse = B*inv(R)*B';
P = are(A,BRinverse,Q);
%Feedback Gain
disp('Feedback Gains for the system')
K = inv(R)*B'*P
%%%%%%%%%%%%%%
%Simulate the system
%%%%%%%%%%%%%%
%Simulation time step
T=0:0.02:5;
%Impulse response input
U=zeros(size(T));
U(1)= 1;
%System matrices with feedback
Ac = [(A-B*K)];
Bc = [B];
Cc = [C];
Dc = [D];
%Obtaining the States and the output response
[Y,X]=lsim(Ac,Bc,Cc,Dc,U,T);
%Obtaining the torque needed to control the system
[n m] = size (X);
for i = 1:n
UU(i) = -K*X(i,:)';
end
new_poles = eig(Ac)
figure,
%plot the states
title(' Impulse response of the plant with LQR control')
subplot(1,1,1), plot(T,X(:,4) ), xlabel('Time [s]'),

ylabel('Position[m],Velocity[m/s],Angle[rad],Angular velocity[rad/s]')

legend('x','xDot','phi','phiDot')

%plot the outputs
%subplot(3,1,2), plot(T,[Y(:,1) Y(:,2)]), xlabel('Time [s]'), ylabel('Outputs')
%legend('x','theta')
%plot the control input
%subplot(2,1,2), plot(T,UU), xlabel('Time [s]'), ylabel('Control u')