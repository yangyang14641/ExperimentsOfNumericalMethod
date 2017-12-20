

n=input('please input the n  ')
I=zeros(1,n);
I(1,1)=1/5-1/25*log(6);

for i=2:n
    I(1,i)=1/(5*i)-1/5*I(1,i-1);
end


%I1=zeros(1,n);
%I1(1,1)=1/5-1/25*log(6);
%for i=2:n
%    I1(1,i)=(1-i*I1(1,i-1))/(i*5);
%end
I
%I1
