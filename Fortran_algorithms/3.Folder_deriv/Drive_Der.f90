Program Drive_Der
  
  Use LibraryDer
  
  Implicit None
  Integer(4), Parameter :: N=200
  Real(rk), Parameter::a=-2._rk*pi,b=2._rk*pi
  Real(rk) :: x(0:N), y(0:N), dy1, dy2, dy3, ddy1, ddy2, ddy3
  Integer(rk) :: i, o, m, e                                     !o=ordine derivazione
                                                                !m+2= numero punti della formula
  Do i=0, N
      x(i)=a+i*(b-a)/N
  End Do
  y=Sin(x)
                                                           
  e=10                                                          !ggggggggggggggggg

  Open (1,file='Der.dat')
  Do i=0, N
     o=1
     m=1
     If (Der(x,y,i,o,m,e,dy1)/=0) Stop 'Error in o=1 m=1!!!'
     m=2
     If (Der(x,y,i,o,m,e,dy2)/=0) Stop 'Error in o=1 m=2!!!'
     m=3
     If (Der(x,y,i,o,m,e,dy3)/=0) Stop 'Error in o=1 m=3!!!'
     o=2
     m=1
     If (Der(x,y,i,o,m,e,ddy1)/=0) Stop 'Error in o=2 m=1!!!'
     m=2
     If (Der(x,y,i,o,m,e,ddy2)/=0) Stop 'Error in o=2 m=2!!!'
     m=3
     If (Der(x,y,i,o,m,e,ddy3)/=0) Stop 'Error in o=2 m=3!!'
     
     Write(1,'(I4,9(x,E19.12))') i,x(i),dy1, dy2,dy3,Cos(x(i)),ddy1,ddy2,ddy3,-Sin(x(i))
     Write(*,'(I4,9(x,E19.12))') i,x(i),dy1, dy2,dy3,Cos(x(i)),ddy1,ddy2,ddy3,-Sin(x(i))
  End Do
  Close(1)
  
End Program Drive_Der
