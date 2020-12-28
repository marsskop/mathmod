A  =[0 1 -1; 1 1 0]
[U, S, V] = svd(A)
disp('q vectors')
U
disp('singular values on the main diagonal')
S
disp('e vectors')
V