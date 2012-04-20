Readme file

mdl files:
Adaptivecontroller : Adaptive controller implementation without robot animation
Adaptivecontroller_sim: Adaptive controller implementation with robot animation
PDcontroller: PD controller implemenataion without robot animation
PDcontroller_sim : PD controller implementation with animation

m files:
Dmat_sim : D matrix function
Cmat_sim : C matrix function
Gmat_sim: G matrix function
Jtraj_q : Position trajectory planning
Jtraj_qd : Velovity planning
JtraJ_qdd : Acceleration planning
traj_start: Trajectory planning
transformation_sim : Transformation matrices
displayarm : Display 3-D plot
The above files have been used along with simulink. Function without "_sim" use global variables


How to view animation :
Install the robotics toolbox from http://petercorke.com/Robotics_Toolbox.html
Copy the contents of the toolbox to /matlab/toolbox/
Run startup_rvc.m
Run simulink files

Note:
Change the traj_start file if you want to change initial and final parameters

