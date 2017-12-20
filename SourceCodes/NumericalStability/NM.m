
n=20
EA1=zeros(1,n);
E1=exp(-1);
EA1(1,1)=E1;
for i=2:n
    EA1(1,i)=1-i*EA1(1,i-1);
end

EA2=zeros(1,n);
EA2(1,n)=-30.1924;
for i=n:-1:2
    EA2(1,i-1)=(1-EA2(1,i))/n;
end

EA1
EA2

    
