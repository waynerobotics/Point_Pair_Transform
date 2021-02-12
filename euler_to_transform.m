function T = euler_to_transform(x,y,z,yaw,pitch,roll)
%EULER_TO_TRANSFORM: converts yawpitchr euler angles and a translation vector to
%create a trasnformation matrix between the two

%Input is how the frame we want to go FROM looks in the frame we want to GO
%TO
%%{B} -> {A} refer to "Introduction to Robotics: Mechanics and Control" fig
%2.7 for drawn example

%%Create the rotation matrix found in eq 2.71
rotation = [cos(yaw)*cos(pitch), cos(yaw)*sin(pitch)*sin(roll)-sin(yaw)*cos(roll),cos(yaw)*sin(pitch)*cos(roll)+sin(yaw)*sin(roll);
            sin(yaw)*cos(pitch), sin(yaw)*sin(pitch)*sin(roll)+cos(yaw)*cos(roll), sin(yaw)*sin(pitch)*cos(roll)-cos(yaw)*sin(roll);
            -sin(pitch),cos(pitch)*sin(roll),cos(pitch)*cos(roll)];
trans = [x;y;z]; %%Create translation vector

T=[rotation,trans;zeros(1,3),1]; %%Attach matrices together using format found in eq 2.19
end

