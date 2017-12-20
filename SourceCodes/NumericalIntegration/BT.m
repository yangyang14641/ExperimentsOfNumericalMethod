%变步长复化梯形法求数值积分
format long; 
%数值积分参数录入
c=input('请输入误差限')
g=input('请输入积分限（行向量）')
a=g(1);
b=g(2);
%步长
h=b-a;
%T1的值
T=h*(targetfun(a)+targetfun(b))/2;
TT=T;
%利用条件判断循环计算积分
while (1)
    TT=T;
    s=0;
    x=a+h/2;
      
    while (x<b)
        s=s+targetfun(x); %累加新节点的函数值
        x=x+h;
    end
    
    T=TT/2+s*h/2;   %用递推公式计算T
    h=h/2;             %步长减半
    
    if(abs(TT-T)<c)
        break;
    end
    
end

T
