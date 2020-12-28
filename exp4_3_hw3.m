hF=figure('NumberTitle','off','Name',...
'L_max_norm');
hA=axes('Parent',hF,'Units','pixels');
[x,y]  = meshgrid(-1:0.1:1,-1:0.1:1);
L_max_norm = zeros(length(x));
for i =1 :1: length(x)
    for j=1:1:length(x)
        L_max_norm(i,j) = max(abs([x(i,j),y(i,j)]));
    end
end
hold on 
m = contour(hA, x,y,L_max_norm,'linewidth',5);
title(hA, 'L max norm ')
hold off
grid on
colorbar('vert')