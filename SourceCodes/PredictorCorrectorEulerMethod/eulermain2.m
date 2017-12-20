% main function for experment 8.9-2
%Initialize variables.
h=input('«Î ‰»Î≤Ω≥§£∫\n');
t=[0 1];
y0=1;

%euler method.
[tout1,yout1]=eulerm('df2',t,y0,h);
figure(1);
plot(tout1,yout1,'b.-');
title('euler method and predict corrector euler method');
hold on;

%predict corrector method.
[tout2 yout2]=pceuler('df2',t,y0,h);
plot(tout2,yout2,'r.--');
legend('EM','PCEM');
ylabel('y');
xlabel('x');
hold off;
grid on;

figure(2)
err=abs(yout2-yout1);
plot(tout1,err,'.--');
title('absolute different between euler method and predict corrector euler method');
ylabel('erro');
xlabel('x');
grid on;