%牛顿迭代法求方程的根
%函数符号表达式与图象预处理模块
syms x;
f=input('请以x为为变量输入f(x)!\n');
df=diff(f);
l=ezplot(f);
set(l,'Color','red');
hold on;
l=ezplot(df);
set(l,'Color','blue');
l=ezplot('0');
set(l,'Color','black');
axis auto;
title('f(x)与f"(x)的图象');
legend('f(x)','f"(x)','y=0');
grid on;
pause;

%数据录入模块
x0=input('请输入估计的初始值:\n');
eps=input('请输入误差限度eps:\n');
N=input('请输入最大迭代次数:\n');

%牛顿迭代法计算模块
i=0;
if(ft(df,x0)==0)
    fprintf('no solution!');
else
   xprev=x0-ft(f,x0)/ft(df,x0);
   xn=x0;
   while(abs(xn-xprev)>eps*abs(xn))
       xprev=xn;
       xn=xn-ft(f,xn)/ft(df,xn);
       i=i+1;
       if(i>N)
           break;
       end
   end
   %数据输出与作图模块
   if(i<=N)
   fprintf('方法收敛!\n');
   fprintf('计算结果:\n')
   format long;
   xn
   fprintf('计算次数:\n')
   i
   plot(xn,0,'bo');
   title('计算结果');
   legend('f(x)','f"(x)','y=0','root');
   hold off;
   else
       fprintf('bad solution!');
   end

end
   