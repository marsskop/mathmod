disp("Make square matrix accorfing to the rule")
n=5;
K=n; M=n;
for k=1:K
  for m=1:M
    a(k,m)=sqrt(2/(n+1))*exp((pi/(n+1))*k*(m-1)*i)
  endfor
endfor
disp("Check if the matrix is unitary"); a*a'