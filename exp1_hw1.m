disp("Solve linear system by Gaussian elimination")
A=[1 1 1;2 1 -1;3 -2 0]
b=[2;-1;8]
C=rref([A b])
n=size(C)
disp("Answer"); x=C(:,n(2))
disp("Check");A*x-b