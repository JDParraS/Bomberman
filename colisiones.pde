boolean colisionCircCirc(int cir1X, int cir1Y, int cir1R, int cir2X, int cir2Y, int cir2R){
  float distX = cir1X - cir2X;
  float distY = cir1Y - cir2Y;
  float distance = sqrt((distX*distX)+(distY*distY));
  if (distance <= cir1R+cir2R){
    return true;
  }
  return false;
}
boolean colisionCuadCirc(int cuadX, int cuadY, int alto, int ancho, int cirX, int cirY, int cirR){
  float testX = cirX;
  float testY = cirY;
  if (cirX < cuadX) testX = cuadX;
  else if (cirX > cuadX + ancho) testX = cuadX+ancho;
  
  if (cirY < cuadY) testY = cuadY;
  else if (cirY > cuadY + alto) testY = cuadY + alto;
  
  float distX = cirX - testX;
  float distY = cirY - testY;
  float distance = sqrt((distX*distX)+(distY*distY));
  
  if (distance <= cirR){
    return true;
  }
  return false;
}
