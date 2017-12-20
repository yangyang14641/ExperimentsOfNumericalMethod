%euler explict method
function [tout,yout]=eulerm(F,tspan,y0,h)
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
    ys(i,:)=y;
    ts(i)=t;
    y=y+h*feval(F,t,y)';
    t=t+h;
    i=i+1;
end

%output.
tout=double(ts);
yout=double(ys');
