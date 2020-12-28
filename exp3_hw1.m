disp("Random matrix"); d=randn(6, 6)
disp("Matrix rank"); rank(d)
disp("Matrix determinant"); det(d)
disp("Eigenvector and eigenvalues of the matrix"); [Eigenvector,Eigenvalues]=eig(d)
disp("Inverted matrix"); inv(d)

disp("Matrix with positive values"); dplus=max(d, zeros(6,6))
disp("Matrix with negative values"); dminus=min(d, zeros(6,6))

disp("Sums in all rows"); sums = sum(d, 2)
disp("Concatenate sums vector to original matrix"); dsums = cat(2, sums, d)
disp("Sortin ascending order concatenated matrix by the sums vector and slice it away"); sorted = sortrows(dsums, 1)(:, 2:end)