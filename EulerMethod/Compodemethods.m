%%%%%%%%%%%%%%%%%%%%%%%%%   Main function      %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% to comapre numerical solution and exactly solution  %%%%%%%
%%%%%%%%%%%%%%%%%%% ODE： diff(y,t)=ky   %%%%%%%%%%%%%%%%%%%%%%%%%
%% Define inputs
k=input('请输入参数k:\n');
tspan=input('请输入时间区间:(例如[0 1])\n');
y0=input('请输入初始值:\n')
h=input('请输入步长:\n');
tstart=tspan(1);
tfinal=tspan(2);
%% Cacualte exactly solution
%%%%%%%%% So obvious the exactly solution is y=exp(kt)    %%%%%%%%%%%%%%
t1=tstart:h:tfinal;
y1=y0*exp(k*t1);
figure('Color',[1 1 1]);
subplot(2,1,1);
plot(t1,y1,'ro-','linewidth',1)
hold on;
grid on;
%% Caculate numerical solution
%%%%%%%%%%%% use Euler methods %%%%%%%%%%%%%%
%main compute
ytemp=y0;
ttemp=tstart;
y2=ytemp;
t2=ttemp;
while (ttemp<tfinal-h)                  %%%%%%% main loop
    ytemp=ytemp+k*h*ytemp;
    ttemp=ttemp+h;
    y2=[y2 ytemp];
    t2=[t2 ttemp];
end
plot(t2,y2,'b+--','linewidth',1)          %%%%%%% plot these data
%%%%%%%%%%%  use varibable step size Runge-Kuatta Methods  %%%%%%%%%%%%%%
f=@(t,y) k*y;                             %%%%%%% Define the ODE
ytemp=y0;
ttemp=tstart;
y3=ytemp;
t3=ttemp;
%main compute
while (ttemp<tfinal-h)
    k1=feval(f,ttemp,ytemp);
    k2=feval(f,ttemp+0.5*h,ytemp+0.5*h*k1);
    k3=feval(f,ttemp+0.5*h,ytemp+0.5*h*k2);
    k4=feval(f,ttemp+h,ytemp+h*k3);
    ytemp=ytemp+h*(k1+2*k2+2*k3+k4)/6;
    ttemp=ttemp+h;
    y3=[y3 ytemp];
    t3=[t3 ttemp];      
end

plot(t3,y3,'g.--','linewidth',1);
%%%%%%%%%%%   Names curves   %%%%%%%%%%%%%%%%
legend('Exactly solution','Euler methods','Runge-Kutta methods');
hold off;
title('Numerical solution and Exactly solution of ODE')
%% %%%%%%%%%%%%% Compare Numerical error  %%%%%%%%%%%%
e1=abs(y2-y1);
e2=abs(y3-y1);
subplot(2,1,2);
plot(t3,e1,'ro--',t3,e2,'bx-');
grid on;
legend('Euler method','Runge-Kutta method');
title('Numerical error')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





