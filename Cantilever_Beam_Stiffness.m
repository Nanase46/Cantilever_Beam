function k = Cantilever_Beam_Stiffness( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID)
%CANTILEVER_BEAM_STIFFNESS 
%@author Li
%date 2018.11
%Calculate the stiffness matrix of the element
%E elasticity modulus;NU Poissons' ratio;thickness h
%input the coordinates of 4 nodes i,j,m,n
%Property parameters of plane problems ID
%output the element stiffness matrix(8*8)

syms s t;%定义符号变量
%由插值条件写出形状函数
a = (yi*(s-1)+yj*(-1-s)+ym*(1+s)+yp*(1-s))/4;
b = (yi*(t-1)+yj*(1-t)+ym*(1+t)+yp*(-1-t))/4;
c = (xi*(t-1)+xj*(1-t)+xm*(1+t)+xp*(-1-t))/4;
d = (xi*(s-1)+xj*(-1-s)+xm*(1+s)+xp*(1-s))/4;
B1 = [a*(t-1)/4-b*(s-1)/4 0 ; 0 c*(s-1)/4-d*(t-1)/4 ;
   c*(s-1)/4-d*(t-1)/4 a*(t-1)/4-b*(s-1)/4];
B2 = [a*(1-t)/4-b*(-1-s)/4 0 ; 0 c*(-1-s)/4-d*(1-t)/4 ;
   c*(-1-s)/4-d*(1-t)/4 a*(1-t)/4-b*(-1-s)/4];
B3 = [a*(t+1)/4-b*(s+1)/4 0 ; 0 c*(s+1)/4-d*(t+1)/4 ;
   c*(s+1)/4-d*(t+1)/4 a*(t+1)/4-b*(s+1)/4];
B4 = [a*(-1-t)/4-b*(1-s)/4 0 ; 0 c*(1-s)/4-d*(-1-t)/4 ;
   c*(1-s)/4-d*(-1-t)/4 a*(-1-t)/4-b*(1-s)/4];
Bfirst = [B1 B2 B3 B4];
Jfirst = [0 1-t t-s s-1 ; t-1 0 s+1 -s-t ;
   s-t -s-1 0 t+1 ; 1-s s+t -t-1 0];
J = [x1 x2 x3 x4]*Jfirst*[y1 ; y2 ; y3 ; y4]/8;
B = Bfirst/J;

if ID == 1
    D = (E/(1-NU*NU))*[1 NU 0;NU 1 0;0 0 (1-NU)/2];%弹性系数矩阵D
elseif ID == 2
    D =(E/(1+NU)/(1-2*NU))*[1-NU NU 0;NU 1-NU 0;0 0 (1-2*NU)/2];
end

BD = J*transpose(B)*D*B;
r = int (int(BD,t,-1,1),s -1,1);%计算积分；int(s,v,a,b)：求定积分运算。a,b分别表示定积分的下限和上限
z = h*r;
k = double(z);

end

