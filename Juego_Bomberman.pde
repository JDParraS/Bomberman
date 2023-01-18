Paredes pared;  //<>//
MatBloquesCem redCem;
MatBloquesLad redLad;
Bomb bomba;
MatBombs matBombs;
BomberMan Bomber;
Enemigo enemigo;
MatEnemigo matEnemigo; //<>//
void setup() {
  size (690, 690);
  background(0, 150, 0);
  Bomber = new BomberMan(); 
  pared = new Paredes();
  pared.iniciar();
  pared.display();
  redCem = new MatBloquesCem();
  redCem.iniciar();
  redLad = new MatBloquesLad();
  redLad.iniciar();
  matEnemigo = new MatEnemigo(1); //<>//
  matEnemigo.inicializar(); //<>//
  matEnemigo.cambiarDireccion(); //<>//
  matBombs = new MatBombs();
}
void draw() {
  background(0, 150, 0);  
  redCem.display();
  redLad.display();
  matEnemigo.inteligenciaDeDeriva(); //<>//
  matEnemigo.caminar(); //<>//
  matEnemigo.display(); //<>//
  matBombs.bombLife(); //<>//
  matBombs.borrarBombas(); //<>//
  pared.display();
  Bomber.movement();
  Bomber.EnemigoxBomber();
  Bomber.ponerBomba(); //<>//
}
