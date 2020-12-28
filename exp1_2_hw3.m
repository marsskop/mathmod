dim = 1000;
d  = 2;
i_matrix = ones(dim).*transpose((1:1:dim));
j_matrix = ones(dim).*((1:1:dim));
i_j_abs_matrix = abs(i_matrix- j_matrix);
A = exp(-i_j_abs_matrix.^2/ d^2);
[eigenvector,eigenvalues] = eig(A);
hF=figure('NumberTitle','off','Name',...
'String oscillations');
hA=axes('Parent',hF,'Units','pixels');
p=plot(eigenvalues*ones(dim,1),transpose(eigenvector(4,:)));
xlabel('Eigen Values')
ylabel('Eigen Vector(i) 1 coordinate')
title('Gaussuian profile')