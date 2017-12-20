%RK4 Methodmethod
function [tout,yout]=RK4(F,tspan,y0,h)
% Initialize variables.
syms ts;
syms ys;
tstart=tspan(1);
tfinal=tspan(2);
t=tstart;
y=y0;
ys=y;
ts(1)=t;
i=2;

%main compute
while (t<=tfinal)
    k1=feval(F,t,y);
    k2=feval(F,t+0.5*h,y+0.5*h*k1');
    k3=feval(F,t+0.5*h,y+0.5*h*k2');
    k4=feval(F,t+h,y+h*k3');
    y=y+h*(k1'+2*k2'+2*k3'+k4')/6;
    ys(i,:)=y;
    t=t+h;
    ts(i)=t;
    i=i+1;
end

%output.
tout=double(ts);
yout=double(ys');
