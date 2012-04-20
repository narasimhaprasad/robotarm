function [T00,T01,T12,T23,T34,T45,T56,T02,T03,T04,T05,T06,T13,T14,T15,T16,T24,T25,T26,T35,T36,T46] = transformation(q)

global l

%% Transformation matrices

T00 = eye(4);

T01 = [cos(q(1)) 0 -sin(q(1)) l(1)*cos(q(1));
       sin(q(1)) 0  cos(q(1)) l(1)*sin(q(1));
       0        -1  0         0;
       0         0  0         1];
   
T12 = [cos(q(2)) 0 -sin(q(2)) 0;
       sin(q(2)) 0  cos(q(2)) 0;
       0        -1  0         0;
       0         0  0         1];
   
T23 = [cos(q(3)) 0  sin(q(3)) l(2)*cos(q(3));
       sin(q(3)) 0 -cos(q(3)) l(2)*sin(q(3));
       0         1  0         0;
       0         0  0         1];
   
T34 = [cos(q(4)) 0  sin(q(4)) 0;
       sin(q(4)) 0 -cos(q(4)) 0;
       0         1  0         0;
       0         0  0         1];
   
T45 = [cos(q(5)) 0 -sin(q(5)) l(3)*cos(q(5));
       sin(q(5)) 0  cos(q(5)) l(3)*sin(q(5));
       0        -1  0         0;
       0         0  0         1];
   
T56 = [cos(q(6)) -sin(q(6)) 0 0;
       sin(q(6))  cos(q(6)) 0 0;
       0          0         1 l(4);
       0          0         0 1];
   
T02 = T01*T12;
T03 = T01*T12*T23;
T04 = T01*T12*T23*T34;
T05 = T01*T12*T23*T34*T45;
T06 = T01*T12*T34*T45*T56;
T13 = T12*T23;
T14 = T12*T23*T34;
T15 = T12*T23*T34*T45;
T16 = T12*T23*T34*T45*T56;
T24 = T23*T34;
T25 = T23*T34*T45;
T26 = T23*T34*T45*T56;
T35 = T34*T45;
T36 = T34*T45*T56;
T46 = T45*T56;

end