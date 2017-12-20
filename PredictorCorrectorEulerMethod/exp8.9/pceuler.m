%Predictor Corrector Euler Methodmethod
function [tout,yout]=pceuler(F,tspan,y0,h)
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
    k2=feval(F,t+h,y+k1'*h);
    y=y+h*(k1'+k2')/2;
    ys(i,:)=y;
    t=t+h;
    ts(i)=t;
    i=i+1;
end

%output.
tout=double(ts);
yout=double(ys');
