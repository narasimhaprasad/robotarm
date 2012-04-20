global q qd qdd
q0 = [0 0 0 0 0 0];
qf = [pi/2 pi/2 pi/2 pi/2 pi/2 pi/2];
qdf = [0 0 0 0 0 0];
qd0 = [5 5 5 5 5 5];
t =10;
q = jtraj_q(q0,qf,t,qd0,qdf);
qd = jtraj_qd(q0,qf,t,qd0,qdf);
qdd = jtraj_qdd(q0,qf,t,qd0,qdf);
t1 = [0:1:t-1]';
q = horzcat(t1,q);
qd = horzcat(t1,qd);
qdd = horzcat(t1,qdd);
