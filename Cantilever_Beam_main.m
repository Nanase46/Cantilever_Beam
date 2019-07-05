%%@author Li
%date 2018.11
%This function is the main function
%平面应变问题 Z向位移分量0  平面应力问题Z向位移分量不为0 
%ID=1 平面应力 ID=2 平面应变
%读取单元节点编号对应关系
fileID = fopen('F:\有限元悬臂梁\数据\10单元\10_unit_33nodes.txt');
c=textscan(fileID,'%f');
c=reshape(cell2mat(c),5,[]);
c=c';
fclose(fileID);
%读取单元坐标
fileID = fopen('F:\有限元悬臂梁\数据\10单元\10_unit_nodecor_origin.txt');
e=textscan(fileID,'%f');
e=reshape(cell2mat(e),3,[]);
e=e';
fclose(fileID);
%基本参数
E = 2e11;%弹性模量 modulus of elasticity
NU = 0.3;% Poisson's ratio
L = 0.4;
d = 0.08;
h = 0.01;
ID = 2;
%对应单元节点关系
Element = cell(1,10);
Ponits = cell(1,18);
%Element{1}第一个单元 逆时针存储；Element{1}{1}1*8数组，存储4个节点的坐标
for i=1:10
    Element{i}= {[e(c(i,2),2:3),e(c(i,3),2:3),e(c(i,4),2:3),e(c(i,5),2:3)]};
end
%计算单元矩阵
Ke = cell(1,10);
for i=1:10
    xi = Element{i}{1}(1);
    yi = Element{i}{1}(2);
    xj = Element{i}{1}(3);
    yj = Element{i}{1}(4);
    xm = Element{i}{1}(5);
    ym = Element{i}{1}(6);
    xp = Element{i}{1}(7);
    yp = Element{i}{1}(8);
    %Ke{i}{1}= Cantilever_Beam_Stiffness( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
    %Ke{i}{1}= BilinearQuadElementStiffness( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
    %Ke{i}{1} = stiffness3( E,NU,xi,yi,xj,yj,xm,ym,xp,yp);
    Ke{i}{1}= Cantilever_Beam_Stiffness2( E,NU,h,xi,yi,xj,yj,xm,ym,xp,yp,ID);
end
% 组装单元刚度矩阵
KK = zeros(36);
for i=1:10
    KK = Cantilever_Beam_Assembly(KK,Ke{i}{1},c(i,2),c(i,3),c(i,4),c(i,5));
end

%设置力边界条件
fe = -4000/5;
F = zeros(36,1);
NO =[4,7,10,13];
for i=1:length(NO)
    F(2*NO(i)) = fe;
end
F(2) = -400;
F(32) = -400;
%求解单元编号
%根部固定 位移阵列1 2 3 4 5 6位移量为0 ，去掉刚度矩阵前6行和前6列，剩下的未知量都是节点位移，可以利用矩阵运算求解
KK1 = KK(7:36,7:36);
F1 = F(7:36,:);
u = KK1\F1;%高斯消元法求解位移阵列
%补全位移阵列 求解支反力
U=zeros(36,1);
for i= 1:30
    U(i+6)=u(i);
end
Fn = KK*U;%Final F
% 
% % 输出节点位移值
% fid=fopen('F:\有限元悬臂梁\数据\10单元\displacement.dat','w');
% fprintf(fid,'\n%s\n','-------------------- NODE DISPLACEMENT ---------------------------');
% fprintf(fid,'\n%s\n',' Node X-coordinate Y-coordinate X-disp Y-disp');
% for i=1:nnode
% fprintf(fid,'%10d%18.8f%18.8f%18.8f%18.8f\n',node(i,1),node(i,2),node(i,3),UUG(2*(i-1)+1),UUG(2*(i-1)+2));
% end
% % 关闭文件
% fclose(fid);



