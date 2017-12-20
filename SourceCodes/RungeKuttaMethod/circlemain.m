%compare between Runge-kutta methods and predict corrector euler method.
%this case's absolute solution is sin(t) and cos(t)
%so the phase space is a circle-->x^2+y^2=1
%in some ways,this is a numerical method to generate circle....

%Initialize variables.
%由于预测校正欧拉法没有自动步长调节功能所以需要指定步长
h=input('请输入预测校正欧拉法步长：\n');
t=[0 6*pi];
y0=[1 0];

%predict and corrector euler method
[tout1,yout1]=pceuler1('harmonic',t,y0,h);
figure(1);
subplot(1,2,1);
plot(tout1,yout1,'b.-');
title('Runge-kutta method and predict corrector euler method');
hold on;

%Runge Kutta Method
[tout2 yout2]=ode23tx('harmonic',t,y0);
plot(tout2,yout2,'r.--');
legend('EM' , 'EM','RK23','RK23');
ylabel('y');
xlabel('x');
hold off;
grid on;

%draw phase space line
subplot(1,2,2);
plot(yout1(1,:),yout1(2,:),'r.-',yout2(:,1),yout2(:,2),'b.--',0,0,'r*');
legend('EM','RK23');
ylabel('y"');
xlabel('y');
title('phase space line');
axis equal;
grid on;

%err line
figure(2)
err1=abs(yout1(1,:)-cos(tout1));
err2=abs(yout2(:,1)-cos(tout2));
subplot(1,2,1);
plot(tout1,err1,'r.-',tout2,err2,'b.--');
legend('EM','RK23');
title('absolute erro for y');
ylabel('y erro');
xlabel('x');
grid on;
subplot(1,2,2)
err1=abs(yout1(2,:)+sin(tout1));
err2=abs(yout2(:,2)+sin(tout2));
plot(tout1,err1,'r.-',tout2,err2,'b.--');
legend('EM','RK23');
title('absolute erro for y"');
ylabel('y" erro');
xlabel('x');
grid on;