l1 = 0.11;
l2 = 0.23;
l3 = 0.23;
l4 = 0.1;
T1 = 0;
T2 = 0;
T3 = 0;
T4 = 0;
T5 = 0;
T6 = 0;


L(1) = link([T1 0 l1 -pi/2], 'standard');
L(2) = link([T2 0 0 -pi/2], 'standard');
L(3) = link([T3 0 l2 pi/2], 'standard');
L(4) = link([T4 0 0 pi/2], 'standard');
L(5) = link([T5 0 l3 -pi/2], 'standard');
L(6) = link([T6 l4 0 0], 'standard');

L(1).sigma = 0;
L(2).sigma = 0;
L(3).sigma = 0;
L(4).sigma = 0;
L(5).sigma = 0;
L(6).sigma = 0;

L(1).m = 1.55;
L(2).m = 0;
L(3).m = 2.35;
L(4).m = 0;
L(5).m = 2.35;
L(6).m = 1.04;
m1 = L(1).m;
m2 = L(3).m;
m3= L(4).m;
m4= L(6).m;

L(1).r = [0 0 -l1/2];
L(2).r = [0 0 0];
L(3).r = [0 0 -l2/2];
L(4).r = [0 0 0];
L(5).r = [0 0 -l3/2];
L(6).r = [0 0 -l4/2];

L(1).I = [0 0 0; 0 0 0;0 0 (m1*l1^2)/3];
L(2).I = zeros(3);
L(3).I = [0 0 0; 0 0 0;0 0 (m2*l2^2)/3];
L(4).I = zeros(3);
L(5).I = [0 0 0; 0 0 0;0 0 (m3*l3^2)/3];
L(6).I = [0 0 0; 0 0 0;0 0 (m4*l4^2)/3];

L(1).Jm =  100e-3;
L(2).Jm =  100e-3;
L(3).Jm =  100e-3;
L(4).Jm =  100e-3;
L(5).Jm =  100e-3;
L(6).Jm =  100e-3;

L(1).G =  1;
L(2).G =  1;
L(3).G =  1;
L(4).G =  1;
L(5).G =  1;
L(6).G =  1;

arm = SerialLink(L);
figure
arm.plot(q_arm.signals.values);
