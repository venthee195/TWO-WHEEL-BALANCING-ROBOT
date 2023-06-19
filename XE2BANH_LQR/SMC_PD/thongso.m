f1=(-0.75*g*sin(x1)/L)/((0.75*((Mw*R+Mb*L*cos(x1))*cos(x1))/(2*Mw+Mb)*L)-1);
f2=(0.75*Mb*L*sin(x1)*cos(x1)*(x2^2)/(2*Mw+Mb)*L)/((0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/(2*Mw+Mb)*L)-1);
g1=((0.75*(Mw*R+Mb*L*cos(x1))*(1+(sin(x1)^2)))+1/R)/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L));

%------------------------------------
f3=((-0.75*g*(Mw*R+Mb*L*cos(x1))*sin(x1))/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L)));
f4=(Mb*L*sin(x1)*(x2^2))/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L));
g2=(0.75*(Mw*R+Mb*L*cos(x1))*(1+(sin(x1)^2))+1/R)/(Mb*L^2)+(1/R)/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L));
%---------------------

x2_dot=((-0.75*g*sin(x1)/L)/((0.75*((Mw*R+Mb*L*cos(x1))*cos(x1))/(2*Mw+Mb)*L)-1))+...
    ((0.75*Mb*L*sin(x1)*cos(x1)*(x2^2)/(2*Mw+Mb)*L)/((0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/(2*Mw+Mb)*L)-1))+...
    (((0.75*(Mw*R+Mb*L*cos(x1))*(1+(sin(x1)^2)))+1/R)/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L)))*C;


x4_2dot=((-0.75*g*(Mw*R+Mb*L*cos(x1))*sin(x1))/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L)))+...
    ((Mb*L*sin(x1)*(x2^2))/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L)))+...
((0.75*(Mw*R+Mb*L*cos(x1))*(1+(sin(x1)^2))+1/R)/(Mb*L^2)+(1/R)/(2*Mw+Mb-(0.75*(Mw*R+Mb*L*cos(x1))*cos(x1)/L)))*C;