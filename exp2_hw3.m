A  =-0.5 + rand(2,2)
if det(A) ~=0
    [U,S,V] = svd(A);
    ORTOG = U* V';
    POSITIV = V*S*V';
    Vector = rand(2,1);

    x1 = [0, Vector(1,1)];
    y1= [0,Vector(2,1)];
    
    rotate_vec = ORTOG*Vector;
    
    x2 = [0, rotate_vec(1,1)];
    y2= [0,rotate_vec(2,1)];
    
    rotated_and_compressed_vector  = POSITIV * rotate_vec;
    
    x3 = [0, rotated_and_compressed_vector(1,1)];
    y3= [0,rotated_and_compressed_vector(2,1)];
    hF=figure('NumberTitle','off','Name',...
    'SVD Theorem Visualisation');
    hA=axes('Parent',hF,'Units','pixels');
    xlim([-1 1])
    ylim([-1 1])
    hold on
    p1= plot(hA,x1,y1);
    text(hA,x1(2),y1(2),'V')
    p2 = plot(hA,x2,y2);
    text(hA,x2(2),y2(2),'V rotated')
    p3 =plot(hA,x3,y3);
    text(hA,x3(2),y3(2),'V rotated and compressed')
    hold off
end