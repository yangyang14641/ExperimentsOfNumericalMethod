function  N=DiffQut(Node) %输入输出定义

n=length(Node(1,:));      %计算节点数目
L=zeros(n,n);             %生成差分矩阵
for i=1:n
    A(i,1)=Node(2,i);      %为差分矩阵赋初值
end

for j=2:n
    for i=j:n
        A(i,j)=(A(i,j-1)-A(i-1,j-1))/(Node(1,i)-Node(1,i-(j-1))); %由n-1阶差分计算n阶差分
    end
end

N=A;

