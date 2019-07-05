M = 50;%位移放大倍数，方便可视化,magnification
hold on
for i = 1:1:500
    A = zeros(1,5);
    B = zeros(1,5);
    A1 = zeros(1,5);
    B1 = zeros(1,5);
    for j = 1:1:4
        A(j) = e(c(i,j+1),2);%原始xi,xj,xm,xp
        B(j) = e(c(i,j+1),3);%原始yi,yj,ym,yp
        A1(j) = A(j) + M*(U(2*c(i,j+1)-1));%位移后的x坐标
        B1(j) = B(j) + M*(U(2*c(i,j+1)));
    end
    A(5) = A(1); 
    B(5) = B(1);
    A1(5) = A1(1);
    B1(5) = B1(1);
    plot(A,B,'k--','LineWidth',0.2);
    axis([0 0.5 -0.1 0.2])
    hold on;
    plot(A1,B1,'r','LineWidth',0.2);
    axis([0 0.5 -0.1 0.2])
    hold on;
    title('500 units segmentation')
    xlabel('length')
    ylabel('deflection')
    legend('Origin','after load')
end
