N = 15;
x = zeros(N, 1);
x(1) = 0.5;
hold on
for r = 1 : 0.001 : 2
  for c = 2 : N
    x(c) = r * min(x(c-1), 1 - x(c-1));
  endfor
  x(1 : N-120) = [];
  t(:, 1) = r;
  plot(t, x, 'k.', 'MarkerSize', 3);
endfor
hold off
xlabel('x'); ylabel('r');
title('Bifurcation diagramm');