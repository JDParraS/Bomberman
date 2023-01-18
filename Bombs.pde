class Bomb {

  //Class definition
  color colorBomb, colorExplosion;
  int xpos, ypos;
  int len_bomb;
  int dir;
  int time1;
  boolean activa;

  //Constructor of bomb

  Bomb() {
    colorBomb=color(255, 0, 0);
    xpos = int(Bomber.PersonajeX() - Bomber.PersonajeX()%30 +15);
    ypos = int(Bomber.PersonajeY() - Bomber.PersonajeY()%30 +15);
    time1 = millis();
    activa = true;
  } 


  //Function to draw a explosion (Yellow circles)
  void explosion(float x, float y, int r) {
    fill(255, 255, 0);
    ellipseMode(CENTER);
    //Right
    if (redCem.matBloquesCem[int(x+1)][int(y)] == null) {
      for (int rr = 1; rr <=r; ++rr) {
        if(x+rr >= 22){continue;}
        circle(x*30+15+rr*30, y*30+15, 30);
        
        //Muere personaje
        if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,int(x*30+15+rr*30),int(y*30+15), 20)){
          Bomber.morir();
        }
        //Muere enemigo
        for (int i = matEnemigo.matEnemig.size() - 1; i >= 0 ; i--){
          Enemigo enem = matEnemigo.matEnemig.get(i);
          if (colisionCircCirc(int(x*30+15+rr*30),int(y*30+15),20,enem.x+15,enem.y+15,15)){
            matEnemigo.matEnemig.remove(i);
            if (matEnemigo.matEnemig.size() == 0){
              textSize(20);
              text("Lo lograste Bro", 320, 330);    
              noLoop();  
            }
          }
        }
      }
    }
    //Left
    if (redCem.matBloquesCem[int(x-1)][int(y)] == null) {
      for (int rr = 0; rr <r; ++rr) {
        if(x-rr <= 1){continue;}
        circle(x*30-15-rr*30, y*30+15, 30);
        
        //Muere personaje
        if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,int(x*30-15-rr*30),int(y*30+15), 20)){
          Bomber.morir();
        }
        //Muere enemigo
        for (int i = matEnemigo.matEnemig.size() - 1; i >= 0 ; i--){
          Enemigo enem = matEnemigo.matEnemig.get(i);
          if (colisionCircCirc(int(x*30-15-rr*30),int(y*30+15),20,enem.x+15,enem.y+15,15)){
            matEnemigo.matEnemig.remove(i);
            if (matEnemigo.matEnemig.size() == 0){
              textSize(20);
              text("Lo lograste Bro", 320, 330);    
              noLoop();  
            }
          }
        }
      }
    }
    //Up
    if (redCem.matBloquesCem[int(x)][int(y+1)] == null) {
      for (int rr = 1; rr <=r; ++rr) {
        if(y+rr >= 22){continue;}
        circle(x*30+15, y*30+15+rr*30, 30);
        
        //Muere personaje
        if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,int(x*30+15),int(y*30+15+rr*30), 20)){
          Bomber.morir();
        }
        //Muere enemigo
        for (int i = matEnemigo.matEnemig.size() - 1; i >= 0 ; i--){
          Enemigo enem = matEnemigo.matEnemig.get(i);
          if (colisionCircCirc(int(x*30+15),int(y*30+15+rr*30),20,enem.x+15,enem.y+15,15)){
            matEnemigo.matEnemig.remove(i);
            if (matEnemigo.matEnemig.size() == 0){
              textSize(20);
              text("Lo lograste Bro", 320, 330);    
              noLoop();  
            }
          }
        }
      }
    }
    //Down
    if (redCem.matBloquesCem[int(x)][int(y-1)] == null) {
      for (int rr = 0; rr <r; ++rr) {
        if(y-rr <= 1){continue;}
        circle(x*30+15, y*30-15-rr*30, 30);
        
        //Muere personaje
        if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,int(x*30+15),int(y*30-15-rr*30), 20)){
          Bomber.morir();
        }
        //Muere enemigo
        for (int i = matEnemigo.matEnemig.size() - 1; i >= 0 ; i--){
          Enemigo enem = matEnemigo.matEnemig.get(i);
          if (colisionCircCirc(int(x*30+15),int(y*30-15-rr*30),20,enem.x+15,enem.y+15,15)){
            matEnemigo.matEnemig.remove(i);
            if (matEnemigo.matEnemig.size() == 0){
              textSize(20);
              text("Lo lograste Bro", 320, 330);    
              noLoop();  
            }
          }
        }
      }
    }
  }

  //Function to delete Lads
  void deleteLads(int x, int y, int r) {
    //Checks all directions and delete lads
    if (redCem.matBloquesCem[int(x+1)][int(y)] == null) {
      for (int rr = 1; rr <= r; ++rr) {
        if(x+rr >= 22){continue;}
          redLad.matBloquesLad[x+rr][y] = null;
      }
    }  
      if (redCem.matBloquesCem[int(x+1)][int(y)] == null) {
        for (int rr = 1; rr <= r; ++rr) {
          if(x-rr < 0){continue;}
        redLad.matBloquesLad[x-rr][y] = null;
    }
  }
    if (redCem.matBloquesCem[int(x)][int(y+1)] == null) {
      for (int rr = 1; rr <= r; ++rr) {
        if(y-rr < 0){continue;}
        redLad.matBloquesLad[x][y-rr] = null;
      }
    }
    if (redCem.matBloquesCem[int(x)][int(y-1)] == null) {
      for (int rr = 1; rr <= r; ++rr) {
        if(y+rr >=22){continue;}
        redLad.matBloquesLad[x][y+rr] = null;
      }
    }
  }

  // Function draw a bomb and delete lads with radius = r = 2
  void display(){
    fill(colorBomb);
    ellipseMode(CENTER);
    circle(xpos,ypos,20);
  }

  //Function to know where the bomb will be placed, TO DO
  int keyPressed() {
    if (key == 'A' || key == 'a') {
    } else if (key == 'W' || key == 'w') {
      dir = 90;
    } else if (key == 'S' || key == 's') {
      dir = 270;
    } else if (key == 'D' || key == 'D') {
      dir = 0;
    }
    return dir;
  }
  void bombLife(){
    int timeActual = millis();
    int resta = timeActual-time1;
    this.display();
    if (resta < 4000 && resta > 2000){
      if (redLad.matBloquesLad[(xpos-15)/30][(ypos-15)/30] == null && redCem.matBloquesCem[(xpos-15)/30][(ypos-15)/30] == null){
        this.explosion((xpos-15)/30,(ypos-15)/30,2);
        this.deleteLads((xpos-15)/30,(ypos-15)/30,2);
      }    
    } else if (resta > 4000) {
      activa = false;
    }
  }
}
class MatBombs{
  ArrayList<Bomb> matBombs;
  MatBombs(){
    matBombs = new ArrayList<Bomb>();
  }
  void nuevaBomba(){
    if (matBombs.size() > 0 && matBombs.size() < 20 ){
      for (int i = matBombs.size() - 1; i >= 0 ; i--){
        Bomb bomb = matBombs.get(i);
        if ((bomb.xpos != int(Bomber.PersonajeX() - Bomber.PersonajeX()%30 +15)) || (bomb.ypos != int(Bomber.PersonajeY() - Bomber.PersonajeY()%30 +15))){
          matBombs.add(new Bomb());
        }
      }
    } else if (matBombs.size() < 20 ) {
      matBombs.add(new Bomb());
    }
  }
  void borrarBombas(){
    for (int i = matBombs.size() - 1; i >= 0 ; i--){
      Bomb bomb = matBombs.get(i);
      if (!bomb.activa){
        matBombs.remove(i);
      }
    }
  }
  void bombLife(){
    borrarBombas();
    for (int i = matBombs.size() - 1; i >= 0 ; i--){
      println(matBombs.size());
      Bomb bomb = matBombs.get(i);
      bomb.bombLife();
    }
  }
}
