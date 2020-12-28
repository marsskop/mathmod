A= [1 0 2 1
    0 1 2 1
    0 2 4 2];
    
#sceletal
rank(A); %rank is 2
C = [1 0 2 1
    0 1 2 1]; %independent minor
B= A / C;
trB=B';
trC=C';
B_=inv(trB*B)*trB;
C_=trC*inv(C*trC);
A_=C_*B_;
A_

#singular
[U S V]=svd(A);
S_=diag(S);
for i = 1:2
    S_(i)=1/S_(i);
end
S_=diag(S_);
column = zeros(3,1);
S_=[S_, column];
invS =S_';
A_= V*invS*inv(U);
A_

#pseudoinverse matrix check
pinv(A)