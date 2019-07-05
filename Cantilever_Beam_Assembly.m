function z = Cantilever_Beam_Assembly(KK,k,i,j,m,p )
%Cantilever_Beam_Assembly
%@author Li
%date 2018.11
%This function is to assemble the Element stiffness matrix
%input Element stiffness matrix
%input element node number i,j,m,p
%output total stiffness matrix

DOF(1) = 2*i-1;
DOF(2) = 2*i;
DOF(3) = 2*j-1;
DOF(4) = 2*j;
DOF(5) = 2*m-1;
DOF(6) = 2*m;
DOF(7) = 2*p-1;
DOF(8) = 2*p;

for n1 = 1:8
    for n2 = 1:8
        KK(DOF(n1),DOF(n2)) = KK(DOF(n1),DOF(n2))+k(n1,n2);
    end

end

z = KK;
