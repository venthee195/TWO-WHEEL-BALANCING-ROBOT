clear all;
close all;
global C M0 F
ts=0.02;
T=30;
TimeSet=[0:ts:T];
para=[];

options=odeset('RelTol',1e-3,'AbsTol',[1e-3 1e-3 1e-3 1e-3]);
%options=[];
x0=[0.5,0.3,0,0];
[t,xout]=ode45('dynamical_equation',TimeSet,x0,options,para);
x1=xout(:,1);
x2=xout(:,2);
x3=xout(:,3);
x4=xout(:,4);
s=C(1)*x1+C(2)*x2+C(3)*x3+C(4)*x4;
if F==1
M0=40;
u=-M0*sign(s);
elseif F==2
beta=30;
delta=0;
    for k=1:1:T/ts+1
u(k) = -(beta*(abs(x1(k))+abs(x2(k))+abs(x3(k))+abs(x4(k))+delta)*sign(s(k)));
    end
end
figure(1);
u = zeros(size(t));
plot(t,[x1 x2 x3 x4]);
xlabel('Thoi gian (giay)');
ylabel('Trang thai cua he thong');
legend('Khoang cach','Toc do','Goc','Toc do nghieng');
axis([0 10 -0.4 0.8]);
figure(2);
plot(t,s,'r');
xlabel('Thoi gian (giay)');
ylabel('Mat truot');
axis([0 10 -0.15 0.15]);
figure(3);
plot(t,u,'r');
xlabel('Thoi gian (giay)');
ylabel('Tin hieu dieu khien');
axis([0 10 -50 50]);
figure(4);
plot(t,[x2,x4]);
xlabel('Thoi gian (giay)');
ylabel('Trang thai cua he thong')
legend('Toc do','Toc do nghieng');
axis([0 10 -0.4 0.4]);
figure(5);
plot(t,x3);
xlabel('Thoi gian (giay)');
ylabel('Trang thai goc nghieng cua he thong');
legend('Goc nghieng (rad)');
axis([0 10 -0.04 0.04]);
figure(6);
plot(t,x4);
xlabel('Thoi gian (giay)');
ylabel('Toc do goc nghieng cua he thong');
legend('Toc do goc nghieng (rad/s)');
axis([0 10 -0.05 0.15]);