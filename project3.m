n1 = 20;
n2 = 40;
n3 = 50;
n4 = 160;
p1 = 0:n1;              %%1-20 
p2 = 0:n2;              %%1-40
p3 = 0:n3;              %%1-50
p4 = 0:n4 ;             %%1-160
p5 = 0:20*40*50*160;    %%1-8001
h1 = 1/n1;
h2 = 1/n2;
h3 = 1/n3;
h4 = 1/n4;
m1axerror20 = -1000;
m1axerror40 = -1000;
m1axerror50 = -1000;
m1axerror160 =-1000;
m2axerror20 = -1000;
m2axerror40 = -1000;
m2axerror50 = -1000;
m2axerror160 =-1000;
y1 = zeros(1,n1);
y2 = zeros(1,n2);
y3 = zeros(1,n3);
y4 = zeros(1,n4);
yreal1 = pi*cos(pi*p1/n1);
yreal2 = pi*cos(pi*p2/n2); 
yreal3 = pi*cos(pi*p3/n3); 
yreal4 = pi*cos(pi*p4/n4); 
for i = 1:n1+1
    y1(i) = sin(pi*(h1*(i-1)));
end
for i = 1:n2+1
    y2(i) = sin(pi*(h2*(i-1)));
end
for i = 1:n3+1
    y3(i) = sin(pi*(h3*(i-1)));
end
for i = 1:n4+1
    y4(i) = sin(pi*(h4*(i-1)));
end



%%  liangdian 


yp1 = zeros(1,n1);
yp2 = zeros(1,n2);
yp3 = zeros(1,n3);
yp4 = zeros(1,n4); 

ypp1 = zeros(1,n1);
ypp2 = zeros(1,n2);
ypp3 = zeros(1,n3);
ypp4 = zeros(1,n4); 

for i = 1:n1
    yp1(i) = (y1(i+1)-y1(i))/h1;
     if (abs(yp1(i)-yreal1(i+1)) > m1axerror20)
       m1axerror20 = abs(yp1(i) - yreal1(i+1));
    end
end
for i = 1:n2
    yp2(i) = (y2(i+1)-y2(i))/h2;
     if (abs(yp2(i)-yreal2(i+1)) > m1axerror40)
       m1axerror40 = abs(yp2(i) - yreal2(i+1));
    end
end
for i = 1:n3
    yp3(i) = (y3(i+1)-y3(i))/h3;
     if (abs(yp3(i)-yreal3(i+1)) >m1axerror50)
      m1axerror50 = abs(yp3(i) - yreal3(i+1));
    end
end
for i = 1:n4
    yp4(i) = (y4(i+1)-y4(i))/h4;
     if (abs(yp4(i)-yreal4(i+1)) > m1axerror160)
       m1axerror160 = abs(yp4(i) - yreal4(i+1));
    end
end







%%  sandian 


for i = 2:n1
    ypp1(i) = (y1(i+1)-y1(i-1))/(2*h1);
     if (abs(ypp1(i)-yreal1(i)) > m2axerror20)
       m2axerror20 = abs(ypp1(i) - yreal1(i));
    end
end
for i = 2:n2
    ypp2(i) = (y2(i+1)-y2(i-1))/(2*h2);
    if (abs(ypp2(i)-yreal2(i)) > m2axerror40)
       m2axerror40 = abs(ypp2(i) - yreal2(i));
    end
end
for i = 2:n3
    ypp3(i) = (y3(i+1)-y3(i-1))/(2*h3);
    if (abs(ypp3(i)-yreal3(i)) > m2axerror50)
       m2axerror50 = abs(ypp3(i) - yreal3(i));
    end
end
for i = 2:n4
    ypp4(i) = (y4(i+1)-y4(i-1))/(2*h4);
    if (abs(ypp4(i)-yreal4(i)) > m2axerror160)
       m2axerror160 = abs(ypp4(i) - yreal4(i));
    end
end
disp('this')
ypp1(1) = 1/(2*h1)*(-3*y1(1)+4*y1(2) -y1(3));
ypp1(n1+1) = 1/(2*h1)*(y1(n1-1) -4*y1(n1) +3*y1(n1+1));

ypp2(1) = 1/(2*h2)*(-3*y2(1)+4*y2(2) -y2(3));
ypp2(n2+1) = 1/(2*h2)*(y2(n2-1) -4*y2(n2) +3*y2(n2+1));

ypp3(1) = 1/(2*h3)*(-3*y3(1)+4*y3(2) -y3(3));
ypp3(n3+1) = 1/(2*h3)*(y3(n3-1) -4*y3(n3) +3*y3(n3+1));

ypp4(1) = 1/(2*h4)*(-3*y4(1)+4*y4(2) -y4(3));
ypp4(n4+1) = 1/(2*h4)*(y4(n4-1) -4*y4(n4) +3*y4(n4+1));





%%  badinit
p1 = 0:n1;              %%1-20 
p2 = 0:n2;              %%1-40
p3 = 0:n3;              %%1-50
p4 = 0:n4 ;             %%1-160
p5 = 0:20*40*50*160;    %%1-8001
per1 = 0.01;
per2 = 0.02;
per3 = 0.05;
per4 = 0.001;
yb = sin(pi*p5*1/(20*40*50*160));
for i = 1:20*40*50*160+1
  yb(i) =  yb(i) + rand(1)*per4;
end

yreal1 = pi*cos(pi*p1/n1);
yreal2 = pi*cos(pi*p2/n2); 
yreal3 = pi*cos(pi*p3/n3); 
yreal4 = pi*cos(pi*p4/n4); 
yb1 = zeros(1,n1);
yb2 = zeros(1,n2);
yb3 = zeros(1,n3);
yb4 = zeros(1,n4); 

for i = 1:n1+1
    g = 1+(i-1)*40*50*160;

    yb1(i) = yb(g);
end
for i = 1:n2+1
    g = 1+(i-1)*20*50*160;
    yb2(i) = yb(g);
end
for i = 1:n3+1
    g = 1+(i-1)*20*40*160;
    yb3(i) = yb(g);
end
for i = 1:n4+1
    g = 1+(i-1)*20*40*50;
    yb4(i) = yb(g);
end

ybb1 = zeros(1,n1);
ybb2 = zeros(1,n2);
ybb3 = zeros(1,n3);
ybb4 = zeros(1,n4); 

ybbp1 = zeros(1,n1);
ybbp2 = zeros(1,n2);
ybbp3 = zeros(1,n3);
ybbp4 = zeros(1,n4); 


%%  badliangdian 
maxerror20 = -1000;
maxerror40 = -1000;
maxerror50 = -1000;
maxerror160 =-1000;

for i = 1:n1
    ybb1(i) = (yb1(i+1)-yb1(i))/h1;
    if (abs(ybb1(i)-yreal1(i+1)) > maxerror20)
       maxerror20 = abs(ybb1(i) - yreal1(i+1));
    end
end

for i = 1:n2
    ybb2(i) = (yb2(i+1)-yb2(i))/h2;
    if (abs(ybb2(i)-yreal2(i)) > maxerror40)
       maxerror40 = abs(ybb2(i) - yreal2(i));
    end
end

for i = 1:n3
    ybb3(i) = (yb3(i+1)-yb3(i))/h3;
    if (abs(ybb3(i)-yreal3(i+1)) > maxerror50)
       maxerror50 = abs(ybb3(i) - yreal3(i+1));
    end
end
for i = 1:n4
    ybb4(i) = (yb4(i+1)-yb4(i))/h4;
    if (abs(ybb4(i)-yreal4(i+1)) > maxerror160)
       maxerror160 = abs(ybb4(i) - yreal4(i+1));
    end
end













%% badsandian 

maxerror201= -1000;
maxerror401 = -1000;
maxerror501 = -1000;
maxerror1601 = -1000;
for i = 2:n1
    ybbp1(i) = (yb1(i+1)-yb1(i-1))/(2*h1);
     if (abs(ybbp1(i)-yreal1(i)) > maxerror201)
       maxerror201 = abs(ybbp1(i) - yreal1(i));
    end
end
for i = 2:n2
    ybbp2(i) = (yb2(i+1)-yb2(i-1))/(2*h2);
     if (abs(ybbp2(i)-yreal2(i)) > maxerror401)
       maxerror401= abs(ybbp2(i) - yreal2(i));
    end
end
for i = 2:n3
    ybbp3(i) = (yb3(i+1)-yb3(i-1))/(2*h3);
     if (abs(ybbp3(i)-yreal3(i)) > maxerror501)
       maxerror501 = abs(ybbp3(i) - yreal3(i));
    end
end
for i = 2:n4
    ybbp4(i) = (yb4(i+1)-yb4(i-1))/(2*h4);
     if (abs(ybbp4(i)-yreal4(i)) > maxerror1601)
       maxerror1601 = abs(ybbp4(i) - yreal4(i));
    end
end
disp('this')
ybbp1(1) = 1/(2*h1)*(-3*yb1(1)+4*yb1(2) -yb1(3));
ybbp1(n1+1) = 1/(2*h1)*(yb1(n1-1) -4*yb1(n1) +3*yb1(n1+1));

ybbp2(1) = 1/(2*h2)*(-3*yb2(1)+4*yb2(2) -yb2(3));
ybbp2(n2+1) = 1/(2*h2)*(yb2(n2-1) -4*yb2(n2) +3*yb2(n2+1));

ybbp3(1) = 1/(2*h3)*(-3*yb3(1)+4*yb3(2) -yb3(3));
ybbp3(n3+1) = 1/(2*h3)*(yb3(n3-1) -4*yb3(n3) +3*yb3(n3+1));

ybbp4(1) = 1/(2*h4)*(-3*yb4(1)+4*yb4(2) -yb4(3));
ybbp4(n4+1) = 1/(2*h4)*(yb4(n4-1) -4*yb4(n4) +3*yb4(n4+1));



m1axerror20 
m1axerror40 
m1axerror50 
m1axerror160 
m2axerror20 
m2axerror40 
m2axerror50 
m2axerror160 

maxerror20
maxerror40
maxerror50
maxerror160

maxerror201
maxerror401 
maxerror501 
maxerror1601 

x = 0:0.1:0.3;
y1 = [m1axerror20;m1axerror40;m1axerror50;m1axerror160];
y2 = [m2axerror20;m2axerror40;m2axerror50;m2axerror160];
y3 = [maxerror20;maxerror40;maxerror50;maxerror160];
y4 = [maxerror201;maxerror401;maxerror501;maxerror1601];

disp(y3);
disp(y4);
%%plot(x,y1,'g'); hold on
%%plot(x,y2,'y'); hold on
plot(x,y3,'r'); hold on
plot(x,y4,'b'); hold on