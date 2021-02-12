import Euler_to_Transform as E2T
import math
import scipy.optimize as optimizer
import pandas as pd
import numpy as np
import Point_Pair_Objective as PPO

fromData=pd.read_csv('From_Data.csv')
toData=pd.read_csv('To_Data.csv')

solution = optimizer.minimize(PPO.Point_Pair_Objective_Func,np.array([0,1,0.9,0,0,0.1],dtype=float),(fromData,toData), method='Nelder-Mead', tol=1e-10)
print(solution)








