%% two wheel mobile robot
clear all
close all
syms x1 x2 x3 x4 x5 x6 x5d x6d
A=[0 0 1 0 0 0;0 0 0 1 0 0;0 -409.7184 -162.1273 162.1273 0 0;0 269.6273 78.1496 -78.1496 0 0;0 0 0 0 0 1;0 0 0 0 0 -95.5684];
B=[0 0;0 0;157.5798 157.5798;-75.9576 -75.9576;0 0;-53.0787 53.0787];
dt=0.01;
k=1;
x1d=0/57.3; x2d=0/57.3; x3d=0/57.3; x4d=0;
x1=45/57.3; x2=5/57.3;x3=20/57.3;x4=2/57.3;
X=[x1;x2;x3;x4;x5;x6];
Xd=[x1d;x2d;x3d;x4d;x5d;x6d];
ii=1;
U=[0;0];
c=[0.0003 0.1002;-0.10005 0.1002;-0.22 -0.3;-1 0.005;-0.0011 -0.003;0.000023 -0.00022];
    for tim=0:dt:30
    Xdt=A*X+B*U;
    X=X+Xdt*dt;
    Xt=X-Xd
    e=Xt
    s=c'*Xt
    U=-inv(c'*B)*c'*A*X-k*sign(s)
    thet(ii)=X(1); thetdt(ii)=X(2); thetdtdt(ii)=X(3);
    thetdtdtdt(ii)=X(4);
    ut(ii)=U(1); utt(ii)=U(2);
    et(ii)=e(1); ft(ii)=e(2); gt(ii)=e(3); jt(ii)=e(6);
    x(ii)=x1d; y(ii)=x2d; z(ii)=x3d; v(ii)=x4d;
    time(ii)=tim;
    ii=ii+1;
    plot(x1);
end
plot(t,[x1 x2 x3 x4 x5 x6]);