%Romberg数值积分
format long;
%数值积分参数录入
c=input('请输入误差限')
g=input('请输入积分限（行向量）')
a=g(1);
b=g(2);
%步长
h=b-a;
i=1; %区间裂变次数计数器
%Robberg算法形成了一个矩阵R
sym R;
R(1,1)=h*(targetfun(a)+targetfun(b))/2; %计算T1

while (1)
    i=i+1; %区间裂变次数加一
    s=0;
    x=a+h/2;
    
    while (x<b)
        s=s+targetfun(x);
        x=x+h;
    end
    
    R(i,1)=R(i-1,1)/2+s*h/2;      %计算T2n
    R(i,2)=(4*R(i,1)-R(i-1,1))/3;  %计算Sn
    if(i>2)
     R(i,3)=(16*R(i,2)-R(i-1,2))/15;  %从第二行开始计算Cn
    end
    if(i>3)
        R(i,4)=(64*R(i,3)-R(i-1,3))/63;
    end
    
    h=h/2; %步长减半
    
    if((i>3) & (abs(R(i,4)-R(i-1,4))<c))
        break;
    end
    
end

R
Value=R(i,3)
