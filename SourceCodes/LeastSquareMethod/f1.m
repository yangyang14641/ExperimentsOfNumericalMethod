%多项式拟合子函数
%函数的出入口
function v=f1(Data)
%多项式形式向量的输入
c=input('please input the ploynamil')
%数据处理模块
k=length(c);
xi=Data(1,:);
yi=Data(2,:);
m=length(xi);
o=ones(1,m);
n=0;
%计算多项式有多少项，以确定正则矩阵的列数
for i=1:k
    if c(i) ~=0
        n=n+1;
    end
end
%生成正则矩阵并置零
A=zeros(m,n);
%生成一个p向量用以储存多项式不为零项的次数
p=zeros(1,n);
j=1;
for i=1:k
    if c(i)~=0
        p(j)=i;
        j=j+1;
    end
end
%计算拟合参数
for i=1:n
    A(:,i)=(xi.^(p(i)-1)).*o;
end
x=(A'*A)^(-1) * (A'*yi');
%用所得的拟合参数计算多项式系数向量
b=zeros(1,k);
x=fliplr(x);
for i=1:n
    b(k-p(i)+1)=x(i);
end
%将系数向量作为函数值返回
v=b;

