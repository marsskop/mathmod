% Prikhno M.A 9 var
% z(x, y) = x^2 + y^2, -1 < x < 1, -1 < y < 1

x1 = -1:0.25:1;
[X, Y] = meshgrid(x1);
Z = X.^2 + Y.^2;
surf(X, Y, Z);
pan on
rotate3d on

syms x y z % should install and load package symbolic in octave
z = x*x + y*y;
dzdx = diff(z, 'x');
dzdy = diff(z, 'y');
A = 1 + dzdx^2 + dzdy^2;
B = simplify(A);
B = sqrt(B);
B
S = dblquad(@(x, y) eval(B), -1, 1, -1, 1);
Pmax = 0;
N = 10000;
point = zeros(N, 2);
i = 1;

for x=-1:0.1:1
  for y=-1:0.1:1
    temp = (1 + 4*x^2 + 4*y^2)^(1/2); % instead of eval which is very time-consuming
    if Pmax < temp
      Pmax = temp;
    endif
  endfor
endfor

while (i < N+1)
  x = rand() * 2 - 1;
  y = rand() * 2 - 1;
  t = rand() * Pmax * 1.1;
  temp = (1 + 4*x^2 + 4*y^2)^(1/2) / S;
  if (t < temp)
    point(i, :) = [x, y];
    i = i+1;
  endif
endwhile

figure;
x = point(:, 1);
y = point(:, 2);
z = x.^2 + y.^2;
plot3(x, y, z, '.');
pan on
rotate3d on
