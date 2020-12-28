N = 100;
x1 = 0:1/N:1
y1 = sin(x1);

x2 = zeros(N);
y2 = zeros(N);
for i = 1 : N
  x2(i) = mod(x1(i) + y1(i), 1);
  y2(i) = mod(x1(i) + 2 * y1(i), 1);
endfor

x3 = zeros(N);
y3 = zeros(N);
for i = 1 : N
  x3(i) = mod(x2(i) + y2(i), 1);
  y3(i) = mod(x2(i) + 2 * y2(i), 1);
endfor

f1 = figure;
plot(x1, y1);
f2 = figure;
plot(x2, y2);
f3 = figure;
plot(x3, y3);