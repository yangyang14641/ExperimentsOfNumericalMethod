%最小二乘法拟合主函数

%数据录入模块
Data=input('please input data Matrix')
n=length(Data(1,:));
%插值系数计算模块
P=f1(Data);
%残差计算模块
errf1=norm(polyval(P,Data(1,:))-Data(2,:))
%符号解显示模块
y=poly2str(P,'x')
%数值解及作图模块
t=Data(1,1):0.0001:Data(1,n);
y1=polyval(P,t);
plot(t,y1,'r',Data(1,:),Data(2,:),'o');
legend('y=ploynamil(x)','Data');
title('离散数据点最小二乘法拟合');
xlabel('anxis X');
ylabel('anxis Y');
grid on