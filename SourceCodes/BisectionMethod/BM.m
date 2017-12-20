%二分法方程求根
figure(1);
l=ezplot('sin(x)/sqrt(1+x^2)-tan(x)+log(x)/log(10)',[5 20]);
set(l,'Color','red');
hold on;
l=ezplot('0',[-5 20]);
set(l,'Color','black');
hold off;
title('待求根函数图象')
legend('y=f(x)','y=0')
grid on;
pause;
%数据输入模块
A=input('请输入求根区间\n');
eps=input('请输入误差限eps\n');
a=A(1);
b=A(2);
x0=0;
i=0;
%二分法求根模块
if(ff(a)*ff(b)>0)
    fprintf('may no solution!');
else
    while(abs(a-b)>eps*abs(b))
        x0=(a+b)/2;
        f=ff(x0);
        if(f*ff(a)>0)
            a=x0;
        else
            b=x0;
        end
        x0=(a+b)/2;
        i=i+1;
    end

   %数据输出与作图模块
   fprintf('方法收敛!\n');
   format long;
   fprintf('计算结果:\n')
   x0
   fprintf('计算次数:\n')
   i
   x=A(1):0.01:A(2);
   f=ff(x);
   figure(2);
   plot(x,f,'b',x,0*f,'k',x0,0,'ro');
   grid on;
   title('计算结果');
   legend('y=f(x)','y=0','root');
end