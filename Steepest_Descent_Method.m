%% homeWork5
%   寻找如下函数的最小值，初始位置在(1,1)，相对误差容限为0.1%：
%   f(x,y) = (x-3)^2 + (y-2)^2;

%% 绘制出图像
clc; clear all; close all;
[x,y] = meshgrid(1:.1:5,1:.1:3);
fxy = (x-3).^2 + (y-2).^2;
figure(1);
surf(x,y,fxy);
title('f(x,y) = (x-3)^2+(y-2)^2');
xlabel('x');ylabel('y');zlabel('f(x,y)');

figure(2)
contour(x,y,fxy,20,'LineWidth',1.5);
colorbar;
hold on;
%% 下面进行最速下降法求取f(x,y)的最小值
f = @(x,y)(x-3).^2 + (y-2).^2;
x = zeros(1,10); y = zeros(1,10);
x(1) = 1; y(1) = 1;
step  = zeros(1,10);
G = 2*eye(2);

for i = 1:10
    gradf = G*[x(i)-3;y(i)-2];
    if (norm(gradf)<=1e-5||(f(x(i),y(i))-0<=0.001))
        disp(['第',num2str(i-1),'次迭代之后可得结果']);
        disp(['x = ',num2str(x(i))]);
        disp(['y = ',num2str(y(i))]);
        break;
    end
    step(i) = (gradf.'*gradf)/(gradf.'*G*gradf);
    x(i+1) = x(i) - step(i).*gradf(1);
    y(i+1) = y(i) - step(i).*gradf(2);
    %   绘制路径图
    arrow(x(i),x(i+1),y(i),y(i+1),'headlength',0.1,'headwidth',0.1);
    
end

