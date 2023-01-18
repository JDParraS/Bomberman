

class Bloque{
  int x;
  int y;
  int grosorBloq;
  color colorBloq;
  color colorStroke;
  Bloque(int tx, int ty){
    x=tx;
    y=ty;
    colorStroke=(0);
    grosorBloq=30;
  }
  void display(){
    fill(colorBloq);
    stroke(colorStroke);
    square(x,y,grosorBloq);
  }
}


class BloqueCem extends Bloque {
  BloqueCem(int tx, int ty){
    super(tx,ty);
    colorBloq = color(150);
  }
}

class BloqueLad extends Bloque{
  BloqueLad(int tx, int ty){
      super(tx,ty);
      colorBloq = color (50);
  } 
}

class Paredes{
  BloqueCem[][] matPared;
  Paredes(){
    matPared= new BloqueCem[23][23];
  }
  void iniciar(){
    for ( int i = 0; i < 23; i++){
      for ( int j = 0; j < 23; j++){
        if (i == 0 || i == 22 || j == 0 || j == 22){
          matPared[i][j] = new BloqueCem(i*30,j*30);
        }
      }
    } 
  }
  void display(){
    for ( int i = 0; i < 23; i++){
      for ( int j = 0; j < 23; j++){
        if (matPared[i][j] != null){
          matPared[i][j].display();
        }
      }
    }
  }
}

class MatBloquesCem{
  BloqueCem[][] matBloquesCem;
  MatBloquesCem(){
    matBloquesCem = new BloqueCem[23][23];
  }
  void iniciar(){
    for ( int i = 2; i < 22; i++){
      for ( int j = 2; j < 22; j++){
        if ((i % 2 == 0) && (j % 2 == 0)){
          matBloquesCem[i][j] = new BloqueCem(i*30,j*30);
        }
      }
    }
  }
  void display(){
    for ( int i = 2; i < 22; i++){
      for ( int j = 2; j < 22; j++){
        if ( i % 2 == 0 && j % 2 == 0){
          matBloquesCem[i][j].display();
        }
      }
    }
  }
}

class MatBloquesLad{
  BloqueLad[][] matBloquesLad;
  float rand;
  MatBloquesLad(){
    matBloquesLad = new BloqueLad[23][23];
  }
  void iniciar(){
    for ( int i = 1; i < 22; i++){
      for ( int j = 1; j < 22; j++){
        rand = random(7);
        if ((i % 2 == 1 || j % 2 == 1) && 0 <= rand && rand <= 1){
          matBloquesLad[i][j] = new BloqueLad(i*30,j*30);
        }
      }
    }
  }
  void display(){
    for ( int i = 0; i < 23; i++){
      for ( int j = 0; j < 23; j++){
        if (matBloquesLad[i][j] != null){
          matBloquesLad[i][j].display();
        }
      } 
    }
  }
}
