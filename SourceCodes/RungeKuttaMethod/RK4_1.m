%RK4 Methodmethod
function [tout,yout]=RK4(F,tspan,y0,h)
% Initialize variables.
tstart=tspan(1);
tfinal=tspan(2);
yout=y0;
tout=tstart;
t=tstart;
y=y0;
i=2;

%main compute
while (t<=tfinal)
    k1=feval(F,t,y)';
    k2=feval(F,t+0.5*h,y+0.5*h*k1)';
    k3=feval(F,t+0.5*h,y+0.5*h*k2)';
    k4=feval(F,t+h,y+h*k3)';
    y=y+h*(k1+2*k2+2*k3+k4)/6;
    t=t+h;
    yout=[yout;y];
    tout=[tout;t];      
    i=i+1;
end
