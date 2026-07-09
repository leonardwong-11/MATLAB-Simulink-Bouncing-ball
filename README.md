# MATLAB-Simulink-Bouncing-ball
This project models bouncing ball with energy loss using both MATLAB and Simulink.

The model uses the Symbolic Math Toolbox (syms, int, solve) to analytically compute each parabolic arc by integrating the second derivative (acceleration) which is equal to the gravitational constant g (9.81). The model tracks the last_t_hit as an absolute time anchor and using a local time offset (x - last_t_hit) for each bounce. Which are then pieced together to produce the final function of displacement.

<img width="1632" height="983" alt="Bouncing_ball_matlab" src="https://github.com/user-attachments/assets/50af130e-6c7d-4236-98ea-20b7ff4a5c94" />
Here is a plot of the result produce from the matlab model. Intial condition x0 = 10 and dx/dt = 0. Ran for 10 seconds with the coefficient of restitution e equal 0.8.

The simulink model uses a seconnd order integration block to handle the maths. With the lower limit of displacement x set to 0, it effectively acted as a hard floor. The model then uses the deafult option of reinitialize dx/dt (velocity) when x reaches saturation. This avoids complicated logic such as crossing event and memory blocks.

<img width="1810" height="1138" alt="Bouncing_ball" src="https://github.com/user-attachments/assets/1a5a8ec4-af37-4097-bc3d-f7d4af12a9b9" />
Here is a plot of the result produce from the simulink model. Intial condition x0 = 10 and dx/dt = 0. Ran for 10 seconds with the coefficient of restitution e equal 0.8. \ 

The result from both model is similar with matlab producing a smoother curve. This is because although both model uses integration and model the event as continuous,the timestep form simulink is larger and hence produced a more jagged curve. However the simulink model is far simplier and the seconnd order integration block handlinng everything. This combine with the fact that stepsize can be reduce eeasily in simulink, shows that using simulink to modle this problem is more favourible.
