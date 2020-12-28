% Prikhno, 2. The task is to generate Julia set.

c = -1.25;
[x,y] = meshgrid(-1.5:0.001:1.5,-1:0.001:1);
z = x + 1i * y;
r = max([c,3]);
for k = 1 : 25
    z = z.^2 + c;
end
z(abs(z) >= r) = 0;

contour(abs(z))
axis off
title('Julia set for f(z) = z^2-0.75')
