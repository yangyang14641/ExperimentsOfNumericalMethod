%指数函数最小二乘法拟合主函数

%数据录入模块
Data=input('please input data Matrix')
n=length(Data(1,:));
%插值系数计算模块
A=f2(Data);
%残差计算模块
errf2=norm(A(1)*exp(A(2)*Data(1,:))-Data(2,:))
%符号解显示模块
syms x;
y=A(1)*exp(A(2)*x)
%数值解及作图模块
t=Data(1,1):0.0001:Data(1,n);
y2=A(1)*exp(A(2)*t);
plot(t,y2,'r',Data(1,:),Data(2,:),'o');
legend('y=a*exp(b*x)','Data');
title('离散数据点最小二乘法拟合');
xlabel('anxis X');
ylabel('anxis Y');
grid on