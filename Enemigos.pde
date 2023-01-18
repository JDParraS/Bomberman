class Enemigo{
  color colorEnemigo, colorStroke;
  int x, y, xm, ym, dmx, dmy, n, dx, dy,r, ranDir, testX, testY, checkX, checkY;
  float ranDer, difX, difY, distancia;
  Enemigo(int tx, int ty){
    x = tx;
    y = ty;
    xm = tx/30;
    ym = ty/30;
    n = 0;
    r = 0;
    dx = 0;
    dy = 0;
    dmx = 0;
    dmy = 0;
    colorEnemigo = color(200,50,50);
    colorStroke = color(0);
  }
  void inteligenciaDeDeriva(){
    ranDer = random(5-r);
    if (( x % 30 == 0 && y % 30 == 0 && (ranDer >= 0 && ranDer <= 1))){
      this.cambiarDireccion(int (random(3.99)));
    }
  }
  void cambiarDireccion(int ranDir){
    switch (ranDir){
      case 0:
        dx = 0;
        dy = 2;
        dmx = 0;
        dmy = 1;
        checkX = xm +dmx;
        checkY = ym + dmy;
        if (colision(pared.matPared[checkX][checkY]) || 
        colision(redCem.matBloquesCem[checkX][checkY]) || 
        colision(redLad.matBloquesLad[checkX][checkY])){
          cambiarDireccion(int (random(3.99)));
          r = 0;
          n = 0;
        }
        break;
      case 1:
        dx = 2;
        dy = 0;
        dmx = 1;
        dmy = 0;
        checkX = xm +dmx;
        checkY = ym + dmy;
        if (colision(pared.matPared[checkX][checkY]) || 
        colision(redCem.matBloquesCem[checkX][checkY]) || 
        colision(redLad.matBloquesLad[checkX][checkY])){
          cambiarDireccion(int (random(3.99)));
        }
        break;
      case 2:
        dx = 0;
        dy = -2;
        dmx = 0;
        dmy = -1;
        checkX = xm +dmx;
        checkY = ym + dmy;
        if (colision(pared.matPared[checkX][checkY]) || 
        colision(redCem.matBloquesCem[checkX][checkY]) || 
        colision(redLad.matBloquesLad[checkX][checkY])){
          cambiarDireccion(int (random(3.99)));
        }
        break;
      case 3:
        dx = -2;
        dy = 0;
        dmx = -1;
        dmy = 0;
        checkX = xm +dmx;
        checkY = ym + dmy;
        if (colision(pared.matPared[checkX][checkY]) || 
        colision(redCem.matBloquesCem[checkX][checkY]) || 
        colision(redLad.matBloquesLad[checkX][checkY])){
          cambiarDireccion(int (random(3.99)));
        }
        break;
    }
    r = 0;
    n = 0;
  }

  
  void caminar(Paredes paredes, MatBloquesCem matBloquesCem, MatBloquesLad matBloquesLad){
    x += dx;
    y += dy;
    n++;
    if (n % 15 == 0){
      r++;
      xm += dmx;
      ym += dmy;
      checkX = xm +dmx;
      checkY = ym + dmy;
      revisaMatrices(paredes, matBloquesCem, matBloquesLad);
    }
  }
  boolean colision(Bloque bloqueProximo){
    if (bloqueProximo != null){
          return true;
    } else return false;
  }
  void revisaMatrices(Paredes paredes, MatBloquesCem matBloquesCem, MatBloquesLad matBloquesLad){
    if (colision(paredes.matPared[checkX][checkY]) || 
    colision(matBloquesCem.matBloquesCem[checkX][checkY]) || 
    colision(matBloquesLad.matBloquesLad[checkX][checkY])){
      cambiarDireccion(int(random(3.99)));
      n = 0;
    }
  }
  
  
  void display(){
    ellipseMode(CORNER);  ///Ponerlo en la clase de matriz de enemigo 
    stroke(colorStroke);
    fill(colorEnemigo);
    ellipse(x,y,30,30);
  }
}
class MatEnemigo{
  ArrayList<Enemigo> matEnemig;
  int cantidad;
  MatEnemigo(int tcantidad){
    matEnemig =new ArrayList<Enemigo>();
    cantidad = tcantidad;
  }
  void display(){
    for (int i = matEnemig.size() - 1; i >= 0 ; i--){
      Enemigo enem = matEnemig.get(i);
      enem.display();
    } 
  }
  void cambiarDireccion(){
    for (int i = matEnemig.size() - 1; i >= 0 ; i--){
      Enemigo enem = matEnemig.get(i);
      enem.cambiarDireccion(int(random(3.99)));
    } 
  }
  void inteligenciaDeDeriva(){
    for (int i = matEnemig.size() - 1; i >= 0 ; i--){
      Enemigo enem = matEnemig.get(i);
      enem.inteligenciaDeDeriva();
    } 
  }
  void caminar(){
    for (int i = matEnemig.size() - 1; i >= 0 ; i--){
      Enemigo enem = matEnemig.get(i);
      enem.caminar(pared, redCem, redLad);
    }
  }
  void inicializar(){
    for (int i = 0 ; i < cantidad ; i++ ){
        int ranx = int(random(2,22));
        int rany = int(random(2,22));
        if (redLad.matBloquesLad[ranx][rany]==null && redCem.matBloquesCem[ranx][rany] == null){
          matEnemig.add(new Enemigo(ranx*30,rany*30));
        } else i -= 1;
    }
  }
}
