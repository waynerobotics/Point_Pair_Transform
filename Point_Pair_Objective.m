function error = Point_Pair_Objective(Trans_Param,set1,set2)

set1_x = set1(:,1);
set1_y = set1(:,2);
set1_d = set1(:,3);

set2_x = set2(:,1);
set2_y = set2(:,2);
set2_d = set2(:,3);
set2_points = [set2_x';set2_y';set2_d';ones(1,length(set2_x))];

model_points = euler_to_transform(...
    Trans_Param(1),Trans_Param(2),Trans_Param(3),Trans_Param(4),Trans_Param(5),Trans_Param(6))...
    *set2_points;

model_points_x = model_points(1,:);
model_points_y = model_points(2,:);
model_points_d = model_points(3,:);

error=sum((set1_x'-model_points_x).^2+(set1_y'-model_points_y).^2+(set1_d'-model_points_d).^2);
end

