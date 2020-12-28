% Prikhno M.A 1 var Game of Life by Friedkin

1; % not a function file; Octave feature
function a = rule(A_prev, i, j)
  % if the cell has an even amount of living cells, then it dies
  % if the cell has an odd amount of living cells, then it lives
  
  alive = A_prev(i+1, j) + A_prev(i, j+1) + A_prev(i, j-1) + A_prev(i-1, j);
  if rem(alive, 2) == 0
    a = 0;
  else
    a = 1;
  endif
endfunction

init = [1 1; 1 0]
size = 30;
A = sparse(size, size);
A((size/2):(size/2)+1, (size/2):(size/2)+1) = init;
imshow(A);

A_prev = A;
t = 0;
stop = false;

while ~stop & (t<20)
  for i=2:size-1
    for j=2:size-1
      A(i, j) = rule(A_prev, i, j);
    endfor
  endfor
  imshow(A);
  drawnow;
  
  if A == A_prev
    stop = true;
  endif
  A_prev = A;
  t = t+1;
endwhile
