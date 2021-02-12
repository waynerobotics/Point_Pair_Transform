# Point_Pair_Transform
Code to optimize a transformation matrix between two frames meaning that you can determine how a point in one frame looks in another.

# REQUIRES: 
x,y,d points from a frame that you wish to trasnform FROM{B}
x,y,d points from frame that you wish to transform TO{A}
(NOTE: there must be the same number of points for both frames or it will error out)
(NOTE: Please refer to page 26, figure 2.4 for a picture of what the frames TO{A} and FROM{B} mean

Initial guess as to the (x,y,z) translation between the frames and (yaw, pitch, roll) rotations between the frames
(NOTE: this is the order that the system uses, so the initial guess should look like the following vector [x, y, z, yaw, pitch, roll]

# Returns:
The optimized transform between the two frames {B}->{A}

# References:
Introduction to ROBOTICS, mechanics and control (4th edition)

