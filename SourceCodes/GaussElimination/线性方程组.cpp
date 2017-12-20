#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

void scanarry(double **v,int n);
int Gauss(double **v,double *solution,int n);

void main()                                               /*主函数，其作用在于输入和输出，以及为数组分配内存空间*/
{   

	clock_t start,finish;
	int i,n,count;
	double *m,**p,dauration;
	printf("请输入线性方程组的未知数的个数:");        
	scanf("%d",&n);                                       /*接收用户输入的线性方程组的阶数，以此来决定如何分配内存空间*/
	
	p=(double **)malloc(n*sizeof(double *));              /*malloc函数用于创建动态二维数组*/
	for(i=0;i<n;i++)
		p[i]=(double *)malloc((n+1)*sizeof(double));      /*生成一个n行n+1列的增广矩阵数组*/
	scanarry(p,n);                                        /*调用scanarry函数来为二维数组录入用户的数据*/
	
	m=(double *)malloc(n*sizeof(double));                 /*调用malloc函数创建动态数组以保存结果*/
	
	start=clock();
	count=Gauss(p,m,n);                                   /*调用Gauss函数计算方程的解的值,返回值为1说明系数矩阵奇异*/
    finish=clock();
    
	if(count!=0)
		printf("\n系数矩阵奇异\n");
	else
	{
	  printf("\n线性方程组的解为:\n");
	   for(i=0;i<n;i++)
	   {
           printf("x(%d)=%lf\n",i,*(m+i));
	   }
	
	}
	dauration=(double)(finish-start);
    printf("\n运行时间（毫秒）:%lf",dauration);
	system("pause");                 

}

void scanarry(double **v,int n)                            /*scanarry函数作用是从用户那里接收行列式的值*/
{   
	printf("请输入线性方程组增广矩阵的元素（输入一行后请按回车,每个元素间空一格）:\n");

	int i,j;
	for(i=0;i<n;i++)
		for(j=0;j<n+1;j++)
			scanf("%lf",&v[i][j]);

}


int Gauss(double **v,double *solution,int n)               /*Gauss函数为线性方程组计算函数*/
{    
	int i,j,k,flag=0,p=0;
	double m,s,temp,d;
  for(k=0;k<n&&flag!=1;k++)                                /* k的作用在于记录当前在从上往下数第几个主对角线元素*/
  {    p=k;
	   d=0;
       for(j=k;j<n;j++)
	   {   
		   d=d+(*(*(v+k)+j));
	   }
        if(d==0)
		{
	       flag=1;                                       /*发现矩阵奇异（化简中出现一行全为零），以后不再进行行变换。*/
		}
		   

		temp=fabs((*(*(v+k)+k)));   
		for(i=k+1;i<n&&flag!=1;i++)                       /*利用循环选出列主元素*/
		{           
 		     if(fabs( (*(*(v+i)+k)) )>temp)
			 {
		         p=i;
			     temp=fabs((*(*(v+i)+k)));
			 }
					   
		}

        if(temp==0)                                        /*发现矩阵奇异（对角线有零元素）*/
			flag=1;
		else if(p<n&&p!=k)
		 for(j=k;j<n+1;j++)                                /*对矩阵进行初等行变化*/
		 {
            s=(*(*(v+k)+j));
		    (*(*(v+k)+j))=(*(*(v+p)+j));
            (*(*(v+p)+j))=s;
		 }
					   
      
		for(i=k+1;i<n&&flag!=1;i++)                       /*对第i行进行操作来消元,其中i的初始值为k+1，终止值为行列式阶数*/
		{
			m=*(*(v+i)+k)/(*(*(v+k)+k));                  /*m为高斯消元法中的乘子*/
			for(j=k;j<n+1&&flag!=1;j++)
			{
				*(*(v+i)+j)=*(*(v+i)+j)-m*(*(*(v+k)+j));  /*对i行中的j列元素进行运算，j初始值为k，终止值为行列式阶数*/
			}
		}

  }
	

        printf("正向消元，矩阵被化为:\n");
        for(i=0;i<n;i++)
		{	  
		     for(j=0;j<n+1;j++)
			 printf("%lf ",v[i][j]);
		     printf("\n");
		}






/*回带过程（反向消元）*/
   if(flag==0)
   {
  
	   for(k=n-1;k>=0;k--)             
	   {  
	   
	      for(i=k-1;i>=0;i--)       
		  {
			  m=*(*(v+i)+k)/(*(*(v+k)+k));      
			  for(j=n;j>=0;j--)
			  {
				*(*(v+i)+j)=*(*(v+i)+j)-m*(*(*(v+k)+j));  
			  }
		  
		  }
	   }
		  
    
	   


          printf("反向消元，矩阵被化为:\n");
          for(i=0;i<n;i++)
		  {	  
		      for(j=0;j<n+1;j++)
			   printf("%lf ",v[i][j]);
		       printf("\n");
		  }




	      for(k=n-1;k>=0;k--)                 /*单位化*/
		  {    
				*(*(v+k)+n)=*(*(v+k)+n)/(*(*(v+k)+k));
                *(*(v+k)+k)=1;
		  }                             
	   



      printf("单位化后，矩阵被化为:\n");
      for(i=0;i<n;i++)
	  {	  
		   for(j=0;j<n+1;j++)
			 printf("%lf ",v[i][j]);
		     printf("\n");
	  }


   }

        
/*结果输出部分*/


   for(k=0;k<n;k++)                
   {
	   *(solution+k)=*(*(v+k)+n);

   }                 

			return flag;

}

