hF=figure('NumberTitle','off','Name',...
'L2_norm');
hA=axes('Parent',hF,'Units','pixels');
[x,y]  = meshgrid(-1:0.1:1,-1:0.1:1);
L2_norm = zeros(length(x));
for i =1 :1: length(x)
    for j=1:1:length(x)
        L2_norm(i,j) = sqrt(x(i,j)^2+y(i,j)^2);
    end
end
hold on 
m = contour(hA, x,y,L2_norm,'linewidth',5);
title(hA, 'L2 ')
hold off
grid on
colorbar('vert')