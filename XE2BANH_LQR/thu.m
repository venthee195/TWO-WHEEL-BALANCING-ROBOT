clear all
close all

A = [0 0 1 0 0 0;
     0 0 0 1 0 0;
     0 -409.7184 -162.1273 162.1273 0 0;
     0 269.6273 78.1496 -78.1496 0 0;
     0 0 0 0 0 1;
     0 0 0 0 0 -95.5684];
B = [0 0;
     0 0;
     157.5798 157.5798;
     -75.9576 -75.9576;
     0 0;
     -53.0787 53.0787];
dt = 0.01;
k = 1;

x1d = 0/57.3;
x2d = 0/57.3;
x3d = 0/57.3;
x4d = 0;
x5d = 0;
x6d = 0;

x1 = 45/57.3;
x2 = 5/57.3;
x3 = 20/57.3;
x4 = 2/57.3;
x5 = 0;
x6 = 0;

X = [x1; x2; x3; x4; x5; x6];
Xd = [x1d; x2d; x3d; x4d; x5d; x6d];

ii = 1;
U = [0; 0];

c = [0.0003 0.1002;
     -0.10005 0.1002;
     -0.22 -0.3;
     -1 0.005;
     -0.0011 -0.003;
     0.000023 -0.00022];

for tim = 0:dt:30
    Xdt = A * X + B * U;
    X = X + Xdt * dt;
    Xt = X - Xd;
    e = Xt;
    s = c' * Xt;
    U = -inv(c' * B) * c' * A * X - k * sign(s);
    thet(ii) = X(1);
    thetdt(ii) = X(2);
    thetdtdt(ii) = X(3);
    thetdtdtdt(ii) = X(4);
    ut(ii) = U(1);
    utt(ii) = U(2);
    et(ii) = e(1);
    ft(ii) = e(2);
    gt(ii) = e(3);
    jt(ii) = e(6);
    x(ii) = x1d;
    y(ii) = x2d;
    z(ii) = x3d;
    v(ii) = x4d;
    time(ii) = tim;
    ii = ii + 1;
end

figure;
subplot(2,2,1);
plot(time, thet);
xlabel('Time');
ylabel('Theta');

subplot(2,2,2);
plot(time, thetdt);
xlabel('Time');
ylabel('Theta-dot');

subplot(2,2,3);
plot(time, thetdtdt);
xlabel('Time');
ylabel('Theta-double-dot');

subplot(2,2,4);
plot(time, thetdtdtdt);
xlabel('Time');
ylabel('Theta-triple-dot');

figure;
subplot(2,2,1);
plot(time, ut);
xlabel('Time');
ylabel('Control input U1');

subplot(2,2,2);
plot(time, utt);
xlabel('Time');
ylabel('Control input U2');

subplot(2,2,3);
plot(time, et);
xlabel('Time');
ylabel('Error e1');

subplot(2,2,4);
plot(time, ft);
xlabel('Time');
ylabel('Error e2');

figure;
subplot(2,2,1);
plot(time, gt);
xlabel('Time');
ylabel('Error e3');

subplot(2,2,2);
plot(time, jt);
xlabel('Time');
ylabel('Error e6');

figure;
subplot(2,2,1);
plot(time, x);
xlabel('Time');
ylabel('x1d');

subplot(2,2,2);
plot(time, y);
xlabel('Time');
ylabel('x2d');

subplot(2,2,3);
plot(time, z);
xlabel('Time');
ylabel('x3d');

subplot(2,2,4);
plot(time, v);
xlabel('Time');
ylabel('x4d');

% Calculate and plot psi and phi
psi = zeros(size(thet));
phi = zeros(size(thet));

for i = 1:length(thet)
psi(i) = thet(i) - x1d * time(i);
phi(i) = thetdt(i) - x2d;
end

figure;
subplot(2,1,1);
plot(time, psi);
xlabel('Time');
ylabel('Psi');

subplot(2,1,2);
plot(time, phi);
xlabel('Time');
ylabel('Phi');
