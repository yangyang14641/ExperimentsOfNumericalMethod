%被插函数模块
x=0:1:10;
y=sin(x);
u=-1:0.01:11;
v=sin(u);
sym A;
A=[x;y];
%数值计算模块
X=u;
D=DiffQut(A);
Y=Newtonployinterp(A,D,X);
%图像处理模块
plot(u,v,'b',x,y,'or',X,Y,'k');
legend('y=sin(x)','NODE','y=Newton(x)');
title('y=sin(x)的Newton插值');
xlabel('anxis X');
ylabel('anxis Y');
grid on