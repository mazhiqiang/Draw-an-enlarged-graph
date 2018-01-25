clc
clear;
close all;

h1pxmax = 3;
h1pxmin = 0;
h1pymax = 3;
h1pymin = -1;
h1p = [0.08,0.105,0.86,0.88]; %position of original axe
h2p = [0.2,0.4,0.3,0.3];    % position of enlarged axe

figure('position',[100 100 800 450]);
h1=axes('Position',h1p);
h2=axes('Position',h2p);

x = -pi:pi/10:pi;
y = tan(sin(x)) - sin(tan(x));

a = [0.8;1];
b = [-0.1;0.1];%Target location

c = [(h2p(1)-h1p(1))/h1p(3)*(h1pxmax-h1pxmin)+h1pxmin;
    (h2p(1)-h1p(1)+h2p(3))/h1p(3)*(h1pxmax-h1pxmin)+h1pxmin];
d = [(h2p(2)-h1p(2))/h1p(4)*(h1pymax-h1pymin)+h1pymin;
    (h2p(2)-h1p(2)+h2p(4))/h1p(4)*(h1pymax-h1pymin)+h1pymin];%Enlarged location

[sortsetA,indexA] = sort([a;c]);
[sortsetB,indexB] = sort([b;d]);
dislocation1 = [3,1,4,2];
dislocation2 = [1,3,2,4];
location_flag1 = [1;2;3;4];%At right side
location_flag2 = [3;4;1;2];%At left side
if indexA == location_flag1 
    pointA1 = [a(2),b(1)];
    pointA2 = [a(2),b(2)];
    pointB1 = [c(1),d(1)];
    pointB2 = [c(1),d(2)];
elseif indexA == location_flag2
    pointA1 = [a(1),b(1)];
    pointA2 = [a(1),b(2)];
    pointB1 = [c(2),d(1)];
    pointB2 = [c(2),d(2)];
else
    if b(2)<d(1)||b(2)==d(1)
        pointA1 = [a(1),b(2)];
        pointA2 = [a(2),b(2)];
        pointB1 = [c(1),d(1)];
        pointB2 = [c(2),d(1)]; 
    elseif b(1)>d(2)||b(1)==d(2)
        pointA1 = [a(1),b(1)];
        pointA2 = [a(2),b(1)];
        pointB1 = [c(1),d(2)];
        pointB2 = [c(2),d(2)]; 
    else
        warning('Parameters error');
    end
end

plot(h1,x,y,[a(1) a(1)],[b(1) b(2)],'k-.',...
    [a(2) a(2)],[b(1) b(2)],'k-.',...
    [a(1) a(2)],[b(1) b(1)],'k-.',...
    [a(1) a(2)],[b(2) b(2)],'k-.',...
    [pointA1(1) pointB1(1)],[pointA1(2) pointB1(2)],'k-.',...
    [pointA2(1) pointB2(1)],[pointA2(2) pointB2(2)],'k-.');
ylim(h1,[h1pymin,h1pymax]);
xlabel(h1,'x');
ylabel(h1,'y');
%legend(h1,'\nu=0.3','\nu=0.4','\nu=0.5','\nu=0.6','\nu=0.7','\nu=0.8','\nu=0.9','\nu=0.96','\nu=1','Location','Northeast');

grid(h1);

plot(h2,x,y);
grid(h2);
xlim(h1,[h1pxmin,h1pxmax]);
xlim(h2,a);
ylim(h2,b);

% node_point =zeros(9,size(t,2));
% for i = 1:9
%     if i ==8
%        for j = 1:size(t,2)
%     node_point(i,j)=i*0.1+0.16;
%     end 
%     elseif i ==9
%         for j = 1:size(t,2)
%     node_point(i,j)=i*0.1+0.1;
%         end 
%     else
%     for j = 1:size(t,2)
%     node_point(i,j)=i*0.1+0.2;
%     end
%     end
% end
% h4p = [0.56,0.1,0.4,0.88];
% h4=axes('Position',h4p);
% % figure;
% tau1 = plot3(h4,t,node_point(1,:),length0p3,'--',...
%              t,node_point(2,:),length0p4,':',...
%              t,node_point(3,:),length0p5,'-',...
%              t,node_point(4,:),length0p6,'-.',...
%              t,node_point(5,:),length0p7,'--',...
%              t,node_point(6,:),length0p8,':',...
%              t,node_point(7,:),length0p9,'-.',...
%              t,node_point(8,:),length0p96,':',...
%              t,node_point(9,:),length1,'--');
%          ylabel(h4,'$$\nu$$','Interpreter','latex');
%          xlabel(h4,'真近点角 (rad)');
%          zlabel(h4,'面内角速率');
%          xlim(h4,[0,20]);
% set(tau1,'linewidth',1.5);
% grid(h4);
% set(h4,'Fontsize',10,'linewidth',1,'box','on','boxstyle','full');
set(h1,'Fontsize',12,'FontName','Times New Roman');
set(h2,'Fontsize',12,'FontName','Times New Roman');
% set(h1,'FontName','Times New Roman');
% set(h2,'FontName','Times New Roman');
% % set(h3,'FontName','Times New Roman');
% set(h4,'FontName','Times New Roman');
