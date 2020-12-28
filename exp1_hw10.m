% ensemble (N, V, T), Andersen thermostat, periodic boundaries and pair potential
% on Octave: pkg load symbolic & pkg load statistics

L = 5; % Lattice with 4 atoms in each cell
b = 0.1 * 10^(-9); % Cell size
v0 = 25.0; % Initial velocity scale
N = 4*L^2; % Number of atoms
r = zeros(N, 2); % Positions
v = zeros(N, 2); % Velocities
bvec = [0 0; b/2 0; 0 b/2; b/2 b/2]; % Atom locations in the cell
ip = 0;
lambda = 1e+5; % from andersen thermostat
k = 1.38 * 10^(-23);
T = 300;
m = 19 * 10^(-24);
sigma = k * T / m;

% Generate positions
for ix = 0:L-1
  for iy = 0:L-1
    ro = b * [ix iy];
    for k = 1:4
      ip = ip + 1; % Place the atom
      r(ip, :) = ro + bvec(k, :);
    endfor
  endfor
endfor

% Generate velocities
for i = 1:ip
  v(i, :) = v0 * randn(1, 2);
endfor

% Show initialized lattice
figure;
x = r(:, 1);
y = r(:, 2);
plot(x, y, '.', 'MarkerSize', 13);
xlim([0 L*b]);
ylim([0 L*b]);
pause(0.5);

t = 1e-11; dt = 1e-14; n = ceil(t/dt);
bounds = [L*b L*b]; % Box bounds
a = zeros(N, 2); % Accelerations
rpre = r; % Store last positions
vpre = v; % Store last velocities

for i = 1:n-1
  a(:, :) = 0;
  for i1 = 1:N
    for i2 = i1+1:N
      dr = rpre(i1, :) - rpre(i2, :);
      
      % Periodic boundary conditions
      for k = 1:2
        if dr(k) > bounds(k)/2
          dr(k) = dr(k) - bounds(k);
        endif
        if dr(k) < -bounds(k)/2
          dr(k) = dr(k) + bounds(k);
        endif
      endfor
      
      % Compute force of the potential
      dr2 = sqrt(dr(1)^2 + dr(2)^2);
      F = 0;
      %F = dirac(dr2-b/2) - dirac(dr2-b);
      % because pair potential is essentially a combination of heaviside functions
      % it's diff by coordinates is dirac function
      % that is, force is +- infinity in dr = b/2 and dr = b
      % peridic boundary conditions mean that x = res(x, border)
      % therefore in case on infinite acceleration, velocity or coordinates
      % I can choose a random size of vector directed between two chosen particles
      % because infinite vector will be clipped anyway
      if dr == b/2
        F = randn * L * b / dt /dt;
      endif
      if dr == b
        F = - randn * L * b / dt /dt;
      endif
      aa = F; % thanks to the fact that dirac is either infinity or zero
      a(i1, :) = a(i1, :) + dr/dr2 * aa;
      a(i2, :) = a(i2, :) - dr/dr2 * aa;
    endfor
  endfor
  
  % Integrate
  v(:, :) = vpre(:, :) + a * dt;
  r(:, :) = rpre(:, :) + v(:, :) * dt;
  
  % Periodic boundary conditions
  for i1=1:N
    for k = 1:2
     if r(i1, k) > bounds(k)
       r(i1, k) = r(i1, k) - bounds(k);
     endif
     if r(i1, k) < 0
       r(i1, k) = r(i1, k) + bounds(k);
     endif
    endfor
  endfor
  
  % Plot
  x = r(:, 1);
  y = r(:, 2);
  plot(x, y, '.', 'MarkerSize', 13);
  xlim([0 bounds(1)]);
  ylim([0 bounds(2)]);
  drawnow
  
  rpre = r;
  vpre = v;
  
  % Ansersen thermostat
  for i=1:N
    if rand() < lambda * dt
      vpre(1) = random('norm', 0, sigma);
      vpre(2) = random('norm', 0, sigma);
    endif
  endfor
  
endfor
