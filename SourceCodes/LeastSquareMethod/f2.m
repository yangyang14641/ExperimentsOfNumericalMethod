%指数函数拟合拟合子函数
%函数的出入口
function v=f2(Data)
%数据处理模块
xi=Data(1,:);
yi=log(Data(2,:));
m=length(xi);
o=ones(1,m);
n=2;
A=zeros(m,n);
%生成正则矩阵
A(:,1)=o;
A(:,2)=o.*xi;
%利用正则矩阵计算拟合系数
x=(A'*A)^(-1) * (A'*yi');
%对系数a进行还原
x(1)=exp(x(1));
%将拟合系数列向量转置并作为返回值
v=x';