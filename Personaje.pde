class NPC{
  int x;
  int y;
  int cordx;
  int cordy;
  int alto;
  int ancho;
  color colorFill;
  color colorStroke;
  boolean wPressed, sPressed, dPressed, aPressed, zPressed;
  NPC(int tx, int ty){
    x=tx;
    y=ty;
    colorStroke = (0);
    colorFill = (255);
    alto= 20;
    ancho= 16; 
  }
  
  void display(int x,int y){
    fill(colorFill);
    stroke(colorStroke);
   // rectMode(CENTER);
    rect(x,y,ancho,alto);
  }
}

class BomberMan extends NPC{
  BomberMan(){
    super(40,40);
  }
  int v=2;
   
   Boolean seestrellaLad(int cordx, int cordy){
     for (int i=0; i<=22; i++){
       for(int j=0; j<=22; j++){
         if(redLad.matBloquesLad[i][j] != null && cordx + ancho >= i*30 && cordx <= i*30 + 30 && cordy + alto >= j*30 && cordy <= j*30 + 30){
         return false;
         }
       }
     }
     return true;
   }
   Boolean seestrellaCon(int cordx, int cordy){
      for (int i=60; i<=600; i=i+60){
       for (int j=60; j<=600; j=j+60){
         if(cordx + ancho >= i && cordx <= i + 30 && cordy + alto >= j && cordy <= j + 30){
           return false;
         }       
       }
    }
    return true;
   }
   
   void EnemigoxBomber(){
     for(int i = matEnemigo.matEnemig.size()-1; i>=0;i--){
       Enemigo enem = matEnemigo.matEnemig.get(i);
       if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,enem.x+15,enem.y+15,15)){
          Bomber.morir();  
        }
      }
   }
   
   void BombaxBomber (int cordx, int cordy){
     for(int i = matBombs.matBombs.size()-1; i>=0;i--){
       Bomb bomba = matBombs.matBombs.get(i);
       if (colisionCuadCirc(Bomber.x,Bomber.y,Bomber.alto,Bomber.ancho,bomba.xpos,bomba.ypos,20)){
          //return false;
          Bomber.morir();
        }
     }
     //return true;
   }
  void movement(){
    keyPressed();
    if(wPressed && keyPressed && y>=33 && seestrellaCon(x,y-v) && seestrellaLad(x,y-v)){
      y=y-v;
    }
    
    else if(sPressed && keyPressed &&  y<=637 && seestrellaCon(x,y+v) && seestrellaLad(x,y+v)){
      y=y+v;
    }
    
    else if(dPressed && keyPressed &&  x<=642 && seestrellaCon(x+v,y) && seestrellaLad(x+v,y)){
      x=x+v;
    }
    
    else if(aPressed && keyPressed &&  x>=33 && seestrellaCon(x-v,y) && seestrellaLad(x-v,y)){
      x=x-v;
    }
    else if(zPressed){
      ponerBomba();
    }
    display(x,y);
    keyReleased();
  }
  float PersonajeX(){
    return x;
  }
  float PersonajeY(){
    return y;
  }
  void ponerBomba(){
    if (key== 'b' || key == 'B'){
    matBombs.nuevaBomba();
    } 
    
  }
  void keyPressed(){
    if (key == 'w'){
      wPressed = true;
    }
    else if (key == 's'){
      sPressed = true;
    }
    else if (key == 'd'){
      dPressed = true;
    }
    else if (key == 'a'){
      aPressed = true;
    }
    else if (key == 'z'){
      zPressed = true;
    }
  }
  void keyReleased(){
    if (key == 'w'){
      wPressed = false;
    }
    else if (key == 's'){
      sPressed = false;
    }
    else if (key == 'd'){
      dPressed = false;
    }
    else if (key == 'a'){
      aPressed = false;
    }
    else if (key == 'z'){
      zPressed = false;
    }
  }
  void morir(){
    textSize(128);
    text("F", 320, 330);
    noLoop();
  }
}
