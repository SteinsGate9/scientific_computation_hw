
A=[4 -1 0 -1 0 0 ;
-1 4 -1 0 -1 0 ;
0 -1 4 -1 0 -1;
-1 0 -1 4 -1 0 ;
0 -1 0 -1 4 -1;
0 0 -1 0 -1 4];
b=[0;5;-2;5;-2;6];

 %Univeral Variables
 bound = power(2,127);
 MAXNUM = 1000;
 
 %Jacobi:
 disp('jacobi')
 a=0;
 flag = 0;
 n = length(b);
 x0 = zeros(n,1);
 x1 = ones(n,1);
 while(a <= MAXNUM )
    x0 = x1;
    
 for i=1:n 
     temp = 0;
     for j = 1:i-1
 temp = temp - A(i,j)*x0(j);
     end
     for j = i+1:n
 temp = temp - A(i,j)*x0(j); 
     end
 x1(i) = (b(i) + temp)/A(i,i);
 end

  a= a+1;
if(norm((x1-x0),inf) <= 1e-4)
    disp(a)
    flag = 1;
    break;
end
if( norm(x1,inf) >= bound)
    disp('越界')
    disp(x1)
    break;
end
 if( a > MAXNUM )
    disp('不收敛')
 break;
 end
 
 end
 
 if(flag == 1)
 disp(x1)
 end
 
 
 
 
 
 
 
 
 %GaussSaider:
 a=0;
 flag = 0;
 disp('GaussSaider')
 n = length(b);
 x = zeros(n,1);
 xbefore = zeros(n,1);
 while(a <= MAXNUM )
    
  xbefore = x;

 for i=1:n 
     temp = 0;
     for j = 1:i-1
 temp = temp - A(i,j)*x(j);
     end
     for j = i+1:n
 temp = temp - A(i,j)*x(j); 
     end
 x(i) = (b(i) + temp)/A(i,i);
 end
 a= a+1;
 
if( abs(norm((x),inf)) > bound)
    disp('越界')
    break;
end 

if(max(norm((x-xbefore),inf)) <= 1e-4)
    disp(a)
    flag = 1;
    break;
end
if( a > MAXNUM)
    disp('不收敛')
    break;
end
 end
 if(flag == 1)
 disp(x)
 end
 
 
 
 
 
 
 %Sor % w1 = 1.334 w2 = 1.95 w3 = 0.95:
 a=0;
flag = 0;
 disp('sor')
 n = length(b);
 x0 = zeros(n,1);
 x1 = zeros(n,1);
 set = zeros(1,MAXNUM);

 w1 = 1.334;
 w2 = 1.95;
 w3 = 0.95;
 w4 = 1.1558;
 while(a <= MAXNUM)
     
    x0 = x1;
 for i=1:n 
     temp = 0;
     for j = 1:i-1
 temp = temp - A(i,j)*x1(j);
     end
     for j = i+1:n
 temp = temp - A(i,j)*x0(j); 
     end
 x1(i) = (1-w4)*x0(i)+ w4*(b(i) + temp)/A(i,i);
 end
 
 a= a+1;
 set(a) = norm(x1,inf);
if(max(norm((x1-x0),inf)) <= 1e-4)
    disp(a)
    flag = 1;
    break;
end
if( a > MAXNUM)
    disp('不收敛')
    break;
end
if( abs(norm((x1),inf)) > bound)
    disp('越界')
    break;
end

 end
  if(flag == 1)
  disp(x1)
  end
  px = 1:a;
  py = set(px);
  plot(px,py);
 
 
 