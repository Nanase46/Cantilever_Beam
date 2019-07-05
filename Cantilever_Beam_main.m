%%@author Li
%date 2018.11
%This function is the main function
%ƽ��Ӧ������ Z��λ�Ʒ���0  ƽ��Ӧ������Z��λ�Ʒ�����Ϊ0 
%ID=1 ƽ��Ӧ�� ID=2 ƽ��Ӧ��
%��ȡ��Ԫ�ڵ��Ŷ�Ӧ��ϵ
fileID = fopen('F:\����Ԫ������\����\10��Ԫ\10_unit_33nodes.txt');
c=textscan(fileID,'%f');
c=reshape(cell2mat(c),5,[]);
c=c';
fclose(fileID);
%��ȡ��Ԫ����
fileID = fopen('F:\����Ԫ������\����\10��Ԫ\10_unit_nodecor_origin.txt');
e=textscan(fileID,'%f');
e=reshape(cell2mat(e),3,[]);
e=e';
fclose(fileID);
%��������
E = 2e11;%����ģ�� modulus of elasticity
NU = 0.3;% Poisson's ratio
L = 0.4;
d = 0.08;
h = 0.01;
ID = 2;
%��Ӧ��Ԫ�ڵ��ϵ
Element = cell(1,10);
Ponits = cell(1,18);
%Element{1}��һ����Ԫ ��ʱ��洢��Element{1}{1}1*8���飬�洢4���ڵ������
for i=1:10
    Element{i}= {[e(c(i,2),2:3),e(c(i,3),2:3),e(c(i,4),2:3),e(c(i,5),2:3)]};
end
%���㵥Ԫ����
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
% ��װ��Ԫ�նȾ���
KK = zeros(36);
for i=1:10
    KK = Cantilever_Beam_Assembly(KK,Ke{i}{1},c(i,2),c(i,3),c(i,4),c(i,5));
end

%�������߽�����
fe = -4000/5;
F = zeros(36,1);
NO =[4,7,10,13];
for i=1:length(NO)
    F(2*NO(i)) = fe;
end
F(2) = -400;
F(32) = -400;
%��ⵥԪ���
%�����̶� λ������1 2 3 4 5 6λ����Ϊ0 ��ȥ���նȾ���ǰ6�к�ǰ6�У�ʣ�µ�δ֪�����ǽڵ�λ�ƣ��������þ����������
KK1 = KK(7:36,7:36);
F1 = F(7:36,:);
u = KK1\F1;%��˹��Ԫ�����λ������
%��ȫλ������ ���֧����
U=zeros(36,1);
for i= 1:30
    U(i+6)=u(i);
end
Fn = KK*U;%Final F
% 
% % ����ڵ�λ��ֵ
% fid=fopen('F:\����Ԫ������\����\10��Ԫ\displacement.dat','w');
% fprintf(fid,'\n%s\n','-------------------- NODE DISPLACEMENT ---------------------------');
% fprintf(fid,'\n%s\n',' Node X-coordinate Y-coordinate X-disp Y-disp');
% for i=1:nnode
% fprintf(fid,'%10d%18.8f%18.8f%18.8f%18.8f\n',node(i,1),node(i,2),node(i,3),UUG(2*(i-1)+1),UUG(2*(i-1)+2));
% end
% % �ر��ļ�
% fclose(fid);



