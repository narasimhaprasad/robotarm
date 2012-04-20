function C = Cmat_sim(q,qd)

l = [0.11 0 0.23 0 0.23 0.1]; % Length of links
m = [1.55 0 2.35 0 2.35 1.04]; % mass of links

Q = [0 -1 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0];
[T00,T01,T12,T23,T34,T45,T56,T02,T03,T04,T05,T06,T13,T14,T15,T16...
    T24,T25,T26,T35,T36,T46]=transformation_sim(q);

%% C matrix parameter generation

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

C111 = T00*Q*T00*Q*T01;
C211 = T00*Q*T00*Q*T02;
C212 = T00*Q*T01*Q*T12;
C221 = T00*Q*T01*Q*T12;
C311 = T00*Q*T00*Q*T03;
C312 = T00*Q*T01*Q*T13;
C313 = T00*Q*T02*Q*T23;
C321 = T00*Q*T01*Q*T13;
C331 = T00*Q*T02*Q*T23;
C411 = T00*Q*T00*Q*T04;
C412 = T00*Q*T01*Q*T14;
C413 = T00*Q*T02*Q*T24;
C414 = T00*Q*T03*Q*T34;
C421 = T00*Q*T01*Q*T14;
C431 = T00*Q*T02*Q*T24;
C441 = T00*Q*T03*Q*T34;
C511 = T00*Q*T00*Q*T05;
C512 = T00*Q*T01*Q*T15;
C513 = T00*Q*T02*Q*T25;
C514 = T00*Q*T03*Q*T35;
C515 = T00*Q*T04*Q*T45;
C521 = T00*Q*T01*Q*T15;
C531 = T00*Q*T02*Q*T25;
C541 = T00*Q*T03*Q*T35;
C551 = T00*Q*T04*Q*T45;
C611 = T00*Q*T00*Q*T06;
C612 = T00*Q*T01*Q*T16;
C613 = T00*Q*T02*Q*T26;
C614 = T00*Q*T03*Q*T36;
C615 = T00*Q*T04*Q*T46;
C616 = T00*Q*T05*Q*T56;
C621 = T00*Q*T01*Q*T16;
C631 = T00*Q*T02*Q*T26;
C641 = T00*Q*T03*Q*T36;
C651 = T00*Q*T04*Q*T46;
C661 = T00*Q*T05*Q*T56;

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

%% C matrix elements

C1 = trace(C111*J1*U11')*qd(1)*qd(1)+trace(C211*J2*U21')*qd(1)*qd(1)...
    +trace(C212*J2*U21')*qd(1)*qd(2)+trace(C221*J2*U21')*qd(2)*qd(1)...
    +trace(C311*J3*U31')*qd(1)*qd(1)+trace(C312*J3*U31')*qd(1)*qd(2)...
    +trace(C313*J3*U31')*qd(1)*qd(3)+trace(C321*J3*U31')*qd(2)*qd(1)...
    +trace(C331*J3*U31')*qd(3)*qd(1)+trace(C411*J4*U41')*qd(1)*qd(1)...
    +trace(C412*J4*U41')*qd(1)*qd(2)+trace(C413*J4*U41')*qd(1)*qd(3)...
    +trace(C414*J4*U41')*qd(1)*qd(4)+trace(C421*J4*U41')*qd(2)*qd(1)...
    +trace(C431*J4*U41')*qd(3)*qd(1)+trace(C441*J4*U41')*qd(4)*qd(1)...
    +trace(C511*J5*U51')*qd(1)*qd(1)+trace(C512*J5*U51')*qd(1)*qd(2)...
    +trace(C513*J5*U51')*qd(1)*qd(3)+trace(C514*J5*U51')*qd(1)*qd(4)...
    +trace(C515*J5*U51')*qd(1)*qd(5)+trace(C521*J5*U51')*qd(2)*qd(1)...
    +trace(C531*J5*U51')*qd(3)*qd(1)+trace(C541*J5*U51')*qd(4)*qd(1)...
    +trace(C551*J5*U51')*qd(5)*qd(1)+trace(C611*J6*U61')*qd(1)*qd(1)...
    +trace(C612*J6*U61')*qd(1)*qd(2)+trace(C613*J6*U61')*qd(1)*qd(3)...
    +trace(C614*J6*U61')*qd(1)*qd(4)+trace(C615*J6*U61')*qd(1)*qd(5)...
    +trace(C616*J6*U61')*qd(1)*qd(6)+trace(C621*J6*U61')*qd(2)*qd(1)...
    +trace(C631*J6*U61')*qd(3)*qd(1)+trace(C641*J6*U61')*qd(4)*qd(1)...
    +trace(C651*J6*U61')*qd(5)*qd(1)+trace(C661*J6*U61')*qd(6)*qd(1);
C2 = trace(C211*J2*U22')*qd(1)*qd(1)+trace(C212*J2*U22')*qd(1)*qd(2)...
    +trace(C221*J2*U22')*qd(2)*qd(1)+trace(C311*J3*U32')*qd(1)*qd(1)...
    +trace(C312*J3*U32')*qd(1)*qd(2)+trace(C313*J3*U32')*qd(1)*qd(3)...
    +trace(C321*J3*U32')*qd(2)*qd(1)+trace(C331*J3*U32')*qd(3)*qd(1)...
    +trace(C411*J4*U42')*qd(1)*qd(1)+trace(C412*J4*U42')*qd(1)*qd(2)...
    +trace(C413*J4*U42')*qd(1)*qd(3)+trace(C414*J4*U42')*qd(1)*qd(4)...
    +trace(C421*J4*U42')*qd(2)*qd(1)+trace(C431*J4*U42')*qd(3)*qd(1)...
    +trace(C441*J4*U42')*qd(4)*qd(1)+trace(C511*J5*U52')*qd(1)*qd(1)...
    +trace(C512*J5*U52')*qd(1)*qd(2)+trace(C513*J5*U52')*qd(1)*qd(3)...
    +trace(C514*J5*U52')*qd(1)*qd(4)+trace(C515*J5*U52')*qd(1)*qd(5)...
    +trace(C521*J5*U52')*qd(2)*qd(1)+trace(C531*J5*U52')*qd(3)*qd(1)...
    +trace(C541*J5*U52')*qd(4)*qd(1)+trace(C551*J5*U52')*qd(5)*qd(1)...
    +trace(C611*J6*U62')*qd(1)*qd(1)+trace(C612*J6*U62')*qd(1)*qd(2)...
    +trace(C613*J6*U62')*qd(1)*qd(3)+trace(C614*J6*U62')*qd(1)*qd(4)...
    +trace(C615*J6*U62')*qd(1)*qd(5)+trace(C616*J6*U62')*qd(1)*qd(6)...
    +trace(C621*J6*U62')*qd(2)*qd(1)+trace(C631*J6*U62')*qd(3)*qd(1)...
    +trace(C641*J6*U62')*qd(4)*qd(1)+trace(C651*J6*U62')*qd(5)*qd(1)...
    +trace(C661*J6*U62')*qd(6)*qd(1);
C3 = trace(C311*J3*U33')*qd(1)*qd(1)+trace(C312*J3*U33')*qd(1)*qd(2)...
    +trace(C313*J3*U33')*qd(1)*qd(3)+trace(C321*J3*U33')*qd(2)*qd(1)...
    +trace(C331*J3*U33')*qd(3)*qd(1)+trace(C411*J4*U43')*qd(1)*qd(1)...
    +trace(C412*J4*U43')*qd(1)*qd(2)+trace(C413*J4*U43')*qd(1)*qd(3)...
    +trace(C414*J4*U43')*qd(1)*qd(4)+trace(C421*J4*U43')*qd(2)*qd(1)...
    +trace(C431*J4*U43')*qd(3)*qd(1)+trace(C441*J4*U43')*qd(4)*qd(1)...
    +trace(C511*J5*U53')*qd(1)*qd(1)+trace(C512*J5*U53')*qd(1)*qd(2)...
    +trace(C513*J5*U53')*qd(1)*qd(3)+trace(C514*J5*U53')*qd(1)*qd(4)...
    +trace(C515*J5*U53')*qd(1)*qd(5)+trace(C521*J5*U53')*qd(2)*qd(1)...
    +trace(C531*J5*U53')*qd(3)*qd(1)+trace(C541*J5*U53')*qd(4)*qd(1)...
    +trace(C551*J5*U53')*qd(5)*qd(1)+trace(C611*J6*U63')*qd(1)*qd(1)...
    +trace(C612*J6*U63')*qd(1)*qd(2)+trace(C613*J6*U63')*qd(1)*qd(3)...
    +trace(C614*J6*U63')*qd(1)*qd(4)+trace(C615*J6*U63')*qd(1)*qd(5)...
    +trace(C616*J6*U63')*qd(1)*qd(6)+trace(C621*J6*U63')*qd(2)*qd(1)...
    +trace(C631*J6*U63')*qd(3)*qd(1)+trace(C641*J6*U63')*qd(4)*qd(1)...
    +trace(C651*J6*U63')*qd(5)*qd(1)+trace(C661*J6*U63')*qd(6)*qd(1);
C4 = trace(C411*J4*U44')*qd(1)*qd(1)+trace(C412*J4*U44')*qd(1)*qd(2)...
    +trace(C413*J4*U44')*qd(1)*qd(3)+trace(C414*J4*U44')*qd(1)*qd(4)...
    +trace(C421*J4*U44')*qd(2)*qd(1)+trace(C431*J4*U44')*qd(3)*qd(1)...
    +trace(C441*J4*U44')*qd(4)*qd(1)+trace(C511*J5*U54')*qd(1)*qd(1)...
    +trace(C512*J5*U54')*qd(1)*qd(2)+trace(C513*J5*U54')*qd(1)*qd(3)...
    +trace(C514*J5*U54')*qd(1)*qd(4)+trace(C515*J5*U54')*qd(1)*qd(5)...
    +trace(C521*J5*U54')*qd(2)*qd(1)+trace(C531*J5*U54')*qd(3)*qd(1)...
    +trace(C541*J5*U54')*qd(4)*qd(1)+trace(C551*J5*U54')*qd(5)*qd(1)...
    +trace(C611*J6*U64')*qd(1)*qd(1)+trace(C612*J6*U64')*qd(1)*qd(2)...
    +trace(C613*J6*U64')*qd(1)*qd(3)+trace(C614*J6*U64')*qd(1)*qd(4)...
    +trace(C615*J6*U64')*qd(1)*qd(5)+trace(C616*J6*U64')*qd(1)*qd(6)...
    +trace(C621*J6*U64')*qd(2)*qd(1)+trace(C631*J6*U64')*qd(3)*qd(1)...
    +trace(C641*J6*U64')*qd(4)*qd(1)+trace(C651*J6*U64')*qd(5)*qd(1)...
    +trace(C661*J6*U64')*qd(6)*qd(1);
C5 = trace(C511*J5*U55')*qd(1)*qd(1)+trace(C512*J5*U55')*qd(1)*qd(2)...
    +trace(C513*J5*U55')*qd(1)*qd(3)+trace(C514*J5*U55')*qd(1)*qd(4)...
    +trace(C515*J5*U55')*qd(1)*qd(5)+trace(C521*J5*U55')*qd(2)*qd(1)...
    +trace(C531*J5*U55')*qd(3)*qd(1)+trace(C541*J5*U55')*qd(4)*qd(1)...
    +trace(C551*J5*U55')*qd(5)*qd(1)+trace(C611*J6*U65')*qd(1)*qd(1)...
    +trace(C612*J6*U65')*qd(1)*qd(2)+trace(C613*J6*U65')*qd(1)*qd(3)...
    +trace(C614*J6*U65')*qd(1)*qd(4)+trace(C615*J6*U65')*qd(1)*qd(5)...
    +trace(C616*J6*U65')*qd(1)*qd(6)+trace(C621*J6*U65')*qd(2)*qd(1)...
    +trace(C631*J6*U65')*qd(3)*qd(1)+trace(C641*J6*U65')*qd(4)*qd(1)...
    +trace(C651*J6*U65')*qd(5)*qd(1)+trace(C661*J6*U65')*qd(6)*qd(1);
C6 = trace(C611*J6*U66')*qd(1)*qd(1)+trace(C612*J6*U66')*qd(1)*qd(2)...
    +trace(C613*J6*U66')*qd(1)*qd(3)+trace(C614*J6*U66')*qd(1)*qd(4)...
    +trace(C615*J6*U66')*qd(1)*qd(5)+trace(C616*J6*U66')*qd(1)*qd(6)...
    +trace(C621*J6*U66')*qd(2)*qd(1)+trace(C631*J6*U66')*qd(3)*qd(1)...
    +trace(C641*J6*U66')*qd(4)*qd(1)+trace(C651*J6*U66')*qd(5)*qd(1)...
    +trace(C661*J6*U66')*qd(6)*qd(1);

%% C matrix

C = [C1;
     C2;
     C3;
     C4;
     C5;
     C6];

end