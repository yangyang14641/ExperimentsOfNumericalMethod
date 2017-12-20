function F=Newtonployinterp(A,D,X)  %函数入口出口

n=length(A(1,:));
F=zeros(size(X));
F=F+D(1,1);
m=ones(size(X));

for k=2:n
 m=(X-A(1,k-1)).*m;
 F=F+D(k,k)*m;
end

