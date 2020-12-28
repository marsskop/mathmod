hF=figure('NumberTitle','off','Name',...
'L1_norm');
hA=axes('Parent',hF1,'Units','pixels');
[x,y]  = meshgrid(-1:0.1:1,-1:0.1:1);
L1_norm = zeros(length(x));
for i =1 :1: length(x)
    for j=1:1:length(x)
        L1_norm(i,j) = abs(x(i,j))+abs(y(i,j));
    end
end
hold on 
m = contour(hA, x,y,L1_norm,'linewidth',5);
title(hA, 'L1 ')
hold off
grid on
colorbar('vert')