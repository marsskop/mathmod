%Heisenberg model

N = 100;
D = rand(N, N) * 2 * pi;
D(:, :) = 0;
M = sqrt(sum(sum(cos(D)))^2 + sum(sum(sin(D)))^2);
M
M = M / N / N;
M
Niter = 1e+4;
J = 0.05;
kB = 8.6e-5;
t = 0;
for T = 1000 : 100 : 2000
  for k = 1 : Niter
    i = randi(N, 1, 1);
    j = randi(N, 1, 1);
    temp = D(i, j);
    
    angle = rand(1) * 2 * pi;
    D(i, j) = angle;
    
    if i ~= N
      iright = i + 1;
    else
      iright = 1;
    endif
    
    if i ~= 1
      ileft = i -1;
    else
      ileft = N;
    endif
    
    if j ~= N
      jright = j + 1;
    else
      jright = 1;
    endif
    
    if j ~= 1
      jleft = j -1;
    else
      jleft = N;
    endif
    
    % scalar multiplication
    E1 = -1/2 * J * (cos(temp) * (cos(D(ileft, j)) + cos(D(iright, j)) + cos(D(i, jleft)) + cos(D(i, jright))) + sin(temp) * (sin(D(ileft, j)) + sin(D(iright, j)) + sin(D(i, jleft)) + sin(D(i, jright))));
    E2 = -1/2 * J * (cos(D(i, j)) * (cos(D(ileft, j)) + cos(D(iright, j)) + cos(D(i, jleft)) + cos(D(i, jright))) + sin(D(i, j)) * (sin(D(ileft, j)) + sin(D(iright, j)) + sin(D(i, jleft)) + sin(D(i, jright))));;
    
    if E2 - E1 < 0
      continue;
    else
      if rand() < exp(-2 * (E2 - E1) / kB / T)
        continue;
      else
        D(i, j) = temp;
      endif
    endif
  endfor
  t = t + 1;
  M = sqrt(sum(sum(cos(D)))^2 + sum(sum(sin(D)))^2);
  M = M / N / N;
  m(t) = M;
endfor
figure; plot(1000:100:2000, m, 'o', 'MarkerSize', 3);