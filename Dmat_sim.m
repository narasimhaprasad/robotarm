function D = Dmat_sim(q)

%% Acceleration related D matrix 

l = [0.11 0 0.23 0 0.23 0.1]; % Length of links
m = [1.55 0 2.35 0 2.35 1.04]; % mass of links

Q = [0 -1 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0];
[T00,T01,T12,T23,T34,T45,T56,T02,T03,T04,T05,T06,T13,T14,T15,T16...
    T24,T25,T26,T35,T36,T46]=transformation_sim(q);

%% D matrix parameter generation

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

%% Link inertia  matrices

J1 = [0 0 0                   0;
      0 0 0                   0;
      0 0 (m(1)*l(1)^2)/3 -(m(1)*l(1))/2;
      0 0 -(m(1)*l(1))/2    m(1)];
 
J2 = zeros(4);
 
J3 = [0 0 0                  0;
       0 0 0                  0;
       0 0 (m(3)*l(3)^2)/3 -(m(3)*l(3))/2;
       0 0 -(m(3)*l(3))/2    m(3)];
   
J4 = zeros(4);
 
J5 = [0 0 0                  0;
       0 0 0                  0;
       0 0 (m(5)*l(5)^2)/3 -(m(5)*l(5))/2;
       0 0 -(m(5)*l(3))/2    m(5)];

J6 = [0 0 0                  0;
       0 0 0                  0;
       0 0 (m(6)*l(6)^2)/3 -(m(6)*l(6))/2;
       0 0 -(m(6)*l(6))/2    m(6)];
   
 %% D matrix elements
 
 D11 = trace(U11*J1*U11')+trace(U21*J2*U21')+trace(U31*J3*U31') ...
      +trace(U41*J4*U41')+trace(U51*J5*U51')+trace(U61*J6*U61');
  
 D12 = trace(U21*J2*U22')+trace(U31*J3*U32')+trace(U41*J4*U42') ...
      +trace(U51*J5*U52')+trace(U61*J6*U62');

 D13 = trace(U31*J3*U23')+trace(U41*J4*U33')+trace(U51*J5*U43') ...
      +trace(U61*J6*U53');
  
 D14 = trace(U41*J4*U24')+trace(U51*J5*U34')+trace(U61*J6*U44');
 
 D15 = trace(U51*J5*U25')+trace(U61*J6*U65');
 
 D16 = trace(U61*J6*U26');
 
 D22 = trace(U22*J2*U22')+trace(U32*J3*U32')+trace(U42*J4*U42') ...
      +trace(U52*J5*U52')+trace(U62*J6*U62');
  
 D23 = trace(U32*J3*U33')+trace(U42*J4*U43')+trace(U52*J5*U53') ...
      +trace(U62*J6*U63');
  
 D24 = trace(U42*J4*U44')+trace(U52*J5*U54')+trace(U62*J6*U64');
 
 D25 = trace(U52*J5*U55')+trace(U62*J6*U65');
  
 D26 = trace(U62*J6*U66');
 
 D33 = trace(U33*J3*U33')+trace(U43*J4*U43')+trace(U53*J5*U53') ...
      +trace(U63*J6*U63');
  
 D34 = trace(U43*J4*U44')+trace(U53*J5*U54')+trace(U63*J6*U64'); 
 
 D35 = trace(U53*J5*U55')+trace(U63*J6*U65');
 
 D36 = trace(U63*J6*U66');
 
 D44 = trace(U44*J4*U44')+trace(U54*J5*U54')+trace(U64*J6*U64');

 D45 = trace(U54*J5*U55')+trace(U64*J6*U65');

 D46 = trace(U64*J6*U66');
 
 D55 = trace(U55*J5*U55')+trace(U65*J6*U65');
 
 D56 = trace(U65*J6*U66');
 
 D66 = trace(U66*J6*U66');
 
 %% D matrix
 
 D = [D11 D12 D13 D14 D15 D16;
      D12 D22 D23 D24 D25 D26;
      D13 D23 D33 D34 D35 D36;
      D14 D24 D34 D44 D45 D46;
      D15 D25 D35 D45 D55 D56;
      D16 D26 D36 D46 D56 D66];      

end