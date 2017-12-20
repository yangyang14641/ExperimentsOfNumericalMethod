%变量输入模块
sym A;
A=input('请输入插值点的数据矩阵[xi;yi]')
s=length(A(1,:));
%数值计算模块
X=A(1,1):0.01:A(1,s);
Y=ployinterp(A,X);
%图像处理模块
plot(X,Y,A(1,:),A(2,:),'or');
legend('y=Ln(x)','NODE');
title('离散数据点的lagrange插值');
xlabel('anxis X');
ylabel('anxis Y');
grid on
%符号表示模块
symx=sym('x');
P=ployinterp(A,symx);
pretty(P)
simplify(P)