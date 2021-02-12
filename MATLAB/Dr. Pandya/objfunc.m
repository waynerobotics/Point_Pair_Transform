function [e]=objfunc(a,xyz_in,xyz_out,n)
% usage: fminsearch (@(a) objfunc (a, in, out, 6), [ 12 5 6 3.0 pi/2 pi])
%        [T in out] = generatePoints([2 4 6 pi pi pi], 6)

e = 0; % error value

%convert euler rotations to Transform.
T = eul2tr(a(4:6)); % error of each row element

%add in translation vector:
T(1:3, 4) = a(1:3);

%preallocate
model_xyz_out = zeros (n, 4);

%generate output vectors
for i = 1:n
    model_xyz_out(i,:) = T*xyz_in(i,:)';  
end

%compute error
e = sum(sqrt (sum (((xyz_out(:, 1:3) - model_xyz_out(:, 1:3)).^2))))/n;

end
