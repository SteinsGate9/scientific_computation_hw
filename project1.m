


function c=Untitled2(A,b)

n = length(b);
ra = rank(A);
rb = rank(b);
c = zeros(n ,1);
if(ra < rb)
    disp('wujie');
    return;
end

if(ra == rb&& ra == n)
for i =1:n
    max = abs(A(i,i));
    ik = i;
    
    for j=i+1:n
        
    if(abs(A(j,i) > max))
        max = abs(A(j,i));
        ik = j;
    end
  
    end  
      temp = A(i,:);
      A(i,:) = A(ik,:);
      A(ik,:) = temp;
      
       temp = b(i,:);
      b(i,:) = b(ik,:);
      b(ik,:) = temp;
      
      for p = i+1:n
          
          m = A(p,i)/A(i,i)
          
          for j2 = i:n
         
          A(p,j2) = A(p,j2)- m*A(i,j2);
          end
           b(p,1)  = b(p,1)- m*b(i,1);
          
      end
      
    

end

c(n)=b(n)/A(n,n);
for i=n-1:-1:1
    sum =0 ;
    for j = i+1: n
        sum  = sum + A(i,j)*c(j);  
    end
    c(i)=(c(i)-sum)/A(i,i);
  
end

else 
    disp('wuqiong');
    return 
end
end



