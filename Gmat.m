function G = Gmat(q)

global m l mx my mz

g = [0;0;-9.8;0];
Q = [0 -1 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0];
[T00,T01,T12,T23,T34,T45,T56,T02,T03,T04,T05,T06,T13,T14,T15,T16...
    T24,T25,T26,T35,T36,T46]=transformation(q);
%% G matrix parameter generation

U11 = T00*Q*T01;
U21 = T00*Q*T02;
U22 = T01*Q*T12;
U31 = T00*Q*T03;
U32 = T01*Q*T13;
U33 = T02*Q*T23;
U41 = T00*Q*T04;
U42 = T01*Q*T14;
U43 = T02*Q*T24;
U44 = T03*Q*T34;
U51 = T00*Q*T05;
U52 = T01*Q*T15;
U53 = T02*Q*T25;
U54 = T03*Q*T35;
U55 = T04*Q*T45;
U61 = T00*Q*T06;
U62 = T01*Q*T16;
U63 = T02*Q*T26;
U64 = T03*Q*T36;
U65 = T04*Q*T46;
U66 = T06*Q*T56;
U12 = 0;
[U13,U14,U15,U16,U23,U24,U25,U26,U34,U35,U36,U45,U46,U56] = deal(U12);
%% G matrix parameters

rj1 = [mx(1);my(1);mz(1);1];
rj2 = [mx(2);my(2);mz(2);1];
rj3 = [mx(3);my(3);mz(3);1];
rj4 = [mx(4);my(4);mz(4);1];
rj5 = [mx(5);my(5);mz(5);1];
rj6 = [mx(6);my(6);mz(6);1];

% G matrix elements

g1 = m(1)*g'*U11*rj1+m(2)*g'*U21*rj2+m(3)*g'*U31*rj3+m(4)*g'*U41*rj4...
    +m(5)*g'*U51*rj5+m(6)*g'*U61*rj6;
g2 = m(2)*g'*U22*rj2+m(3)*g'*U32*rj3+m(4)*g'*U42*rj4+m(5)*g'*U52*rj5...
    +m(6)*g'*U62*rj6;
g3 = m(3)*g'*U33*rj3+m(4)*g'*U43*rj4+m(5)*g'*U53*rj5+m(6)*g'*U63*rj6;
g4 = m(4)*g'*U44*rj4+m(5)*g'*U54*rj5+m(6)*g'*U64*rj6;
g5 = m(5)*g'*U55*rj5+m(6)*g'*U65*rj6;
g6 = m(6)*g'*U66*rj6;

%% G matrix

G = -[g1;
      g2;
      g3;
      g4;
      g5;
      g6];

end