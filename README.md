# MATLAB-Simulink-Bouncing-ball
Modelling bouncing ball with energy loss using both MATLAB and Simulink
<img width="1810" height="1138" alt="Bouncing_ball" src="https://github.com/user-attachments/assets/1a5a8ec4-af37-4097-bc3d-f7d4af12a9b9" />
Here is a plot of the result produce from the simulink model. Intial condition x0 = 10 and dx/dt = 0. Ran for 10 seconds with the coefficient of restitution e equal 0.8.
<img width="1632" height="983" alt="Bouncing_ball_matlab" src="https://github.com/user-attachments/assets/50af130e-6c7d-4236-98ea-20b7ff4a5c94" />
Here is a plot of the result produce from the matlab model. Intial condition x0 = 10 and dx/dt = 0. Ran for 10 seconds with the coefficient of restitution e equal 0.8.

The result from both model is similar with matlab producing a smoother curve. This is because although both model uses integration and model the event as continuous,the timestep form simulink is smaller and hence produced a more jagged curve.
