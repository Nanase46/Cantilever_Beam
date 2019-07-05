function w = Cantilever_Beam_Stress( E,NU,xi,yi,xj,yj,xm,ym,xp,yp,u,ID )
%CANTILEVER_BEAM_STRESS 
%%@author Li
%date 2018.11
%E elasticity modulus;NU Poissons' ratio;thickness h
%ID 1  stress;2 strain
%element displacement array
%output stress                 This function returns the element 
%                              stress vector for a bilinear   
%                              quadrilateral element with modulus 
%                              of elasticity E, Poisson's ratio 
%                              NU, coordinates of 
%                              node 1 (x1,y1), coordinates 
%                              of node 2 (x2,y2), coordinates of 
%                              node 3 (x3,y3), and coordinates of 
%                              node 4 (x4,y4). Use p = 1 for cases 
%                              of plane stress, and p = 2 for 
%                              cases of plane strain.
syms s t;% s,t 为高斯积分点坐标 2*2高斯积分单元
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
   D = (E/(1-NU*NU))*[1, NU, 0 ; NU, 1, 0 ; 0, 0, (1-NU)/2];
elseif ID == 2
   D = (E/(1+NU)/(1-2*NU))*[1-NU, NU, 0 ; NU, 1-NU, 0 ; 0, 0, (1-2*NU)/2];
end
w = D*B*u;
%
% We also calculate the stresses at the centroid of the element
%
wcent = subs(w, {s,t}, {0,0});%subs()函数表示将符号表达式中的某些符号变量替换为指定的新的变量，常用调用方式为：
w = double(wcent);


end

