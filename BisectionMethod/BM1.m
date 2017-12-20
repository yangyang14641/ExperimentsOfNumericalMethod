%二分法方程求根
figure(1);
l=ezplot('2*x*cos(x)+sqrt(x^4-1)-x^2*log(x^3+1)');
set(l,'Color','red');
hold on;
l=ezplot('0');
set(l,'Color','black');
title('待求根函数图象')
legend('y=f(x)','y=0')
hold off;
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
if(ff1(a)*ff1(b)>0)
    fprintf('may no solution!');
else
    while(abs(a-b)>eps*abs(b))
        x0=(a+b)/2;
        f=ff1(x0);
        if(f*ff1(a)>0)
            a=x0;
        else
            b=x0;
        end
        x0=(a+b)/2;
        i=i+1;
    end
   %数据输出与作图模块
  fprintf('方法收敛!\n')
  fprintf('计算结果:\n')
  x0
  fprintf('计算次数:\n')
  i
  x=A(1):0.001:A(2);
  figure(2);
  plot(x,ff1(x),'b',x,0*x,'k',x0,0,'ro');
  grid on;
  title('计算结果');
  legend('y=f(x)','y=0','root');
end