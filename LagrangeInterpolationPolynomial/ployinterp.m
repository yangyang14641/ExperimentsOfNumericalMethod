%lagerange interpolation function
function v=ployinterp(A,u)

%传递变量模块
n=length(A(1,:));
v=zeros(size(u));

%拉格朗日插值多项式计算模块
for k=1:n
    w=ones(size(u));
    for j=[1:k-1 k+1:n] %该循环生成基函数值的一段
        w=(u-A(1,j))./(A(1,k)-A(1,j)).*w; 
    end
    v=v+w*A(2,k);
end

