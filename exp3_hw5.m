1; % not a function file, I'm using Octave...
function f = chua(t, in, alpha, beta)
  x = in(1);
  y = in(2);
  z = in(3);
  
  if x >= 1
    h = (2 * x - 3) / 7;
  elseif x <= -1
    h = (2 * x + 3) / 7;
  else
    h = -x / 7;
  end
  
  xdot = alpha * (y - h);
  ydot = x - y + z;
  zdot = - beta * y;
  
  f = [xdot, ydot, zdot]';
endfunction

hold on
for alpha = 2 : 0.1 : 5
  for beta = 2 : 0.1 : 5
    f = @(t, a) (chua(t, a, alpha, beta));
    [t,a] = ode45(f,[0 100],[1 1 1]);
    plot3(a(:,1),a(:,2),a(:,3))
  endfor
endfor
hold off
