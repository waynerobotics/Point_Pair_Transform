if __name__ == "__main__": #Unit test data
    import math
    x = 10
    y = 5
    d = 0
    yaw = 30*math.pi/180
    pitch = 0
    roll = 0

def Euler_to_Transform(x,y,z,yaw,pitch,roll):
    #Function to calculate the transformation between two coordinate
    import math #Grab math library to calculate cos(x) and sin(x)
    import numpy as np

    #Pre-calculate the required numbers to make code shorter
    cy=math.cos(yaw)
    cp=math.cos(pitch)
    cr=math.cos(roll)
    sy=math.sin(yaw)
    sp=math.sin(pitch)
    sr=math.sin(roll)

    #Calculate a create the transform 
    T=np.array([[cy*cp, cy*sp*sr-sy*cr,cy*sp*cr+sy*sr,x],
               [sy*cp,sy*sp*sr+cy*cr,sy*sp*cr-cy*sr,y],
               [-1*sp,cp*sr,cp*cr,z],
               [0,0,0,1]],dtype=float)

    return T #return the transform

