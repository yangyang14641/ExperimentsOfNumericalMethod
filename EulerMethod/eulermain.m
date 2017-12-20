% main function
h=input('«Î ‰»Î≤Ω≥§£∫\n');
t=[1 2];
y0=1;
%euler method
[tout1 yout1]=eulerm('df1',t,y0,h);
plot(tout1,yout1,'b.');
title('euler method and predict corrector euler method');
legend('EM');
hold on;
%predict corrector method
[tout2 yout2]=pceulerm('df1',t,y0,h);
plot(tout2,yout2,'r.');
legend('PCEM');
hold off;