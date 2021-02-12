def Point_Pair_Objective_Func(x, *Data):
    import numpy as np
    import Euler_to_Transform as E2T
    import math

    from_x=Data[0].x.values #Get the x values from the csv table
    from_y=Data[0].y.values #Get the y values from the csv table
    from_d=Data[0].d.values #Get the d values from the csv table
    from_inputs=np.array([from_x,from_y,from_d], dtype=float) #Stack the X,Y, and Z data in vector form for matrix multiplication
    from_inputs = np.vstack((from_inputs, np.ones((1,np.size(from_x))))) #Append a row of ones at the bottom to be used with transform matrix
 
    model_points=np.matmul(E2T.Euler_to_Transform(x[0],x[1],x[2],x[3],x[4],x[5]),from_inputs) #Multiply the matrices
    model_x=model_points[0] #Get the x values from the model transform
    model_y=model_points[1] #Get the y values from the model transform
    model_d=model_points[2] #Get the d values from the model transform

    to_x=np.array(Data[1].x.values) #Create a numpy array from the data points for the frame we transform to
    to_y=np.array(Data[1].y.values)
    to_d=np.array(Data[1].d.values)

    #Returns the squared error for all the points being compared
    return math.fsum(np.square(to_x-model_x)+np.square(to_y-model_y)+np.square(to_d-model_d))
