 function [T, xyz_in, xyz_out] = generatePoints(a, n)
%a : reo vector input  parameters xyz and euler angles 
% number of points to generate
% how to test it:
% [T in out] = generatePoints([2 4 6 pi pi pi], 6)
% for (i = 1:6) T*in(i,:)' end % should generate output

    %convert euler rotations to Transform.
    T = eul2tr(a(4:6)); % error of each row element
    
    %add in translation vector:
    T(1:3, 4) = a(1:3);
    
    %generate some random xyz points
    xyz_in = 10*rand (n, 3);
    xyz_in = [xyz_in ones(n,1)];
    %preallocate output array
    xyz_out = zeros (n,3);
    xyz_out = [xyz_out ones(n,1)];
    %generate output coordinates
    for i = 1:n
        xyz_out(i,:) = T *xyz_in(i,:)';
    end
    
    %Returns both T and xyz_out .
    
end

