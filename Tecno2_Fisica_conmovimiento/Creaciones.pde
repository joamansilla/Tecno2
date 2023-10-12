
ArrayList<Plataforma> plataformas; 
int plataformaWidth = 50;
int plataformaHeight = 10;
Plataforma ultimaPlataforma;
float tiempoCreacion = 0;
float intervaloCreacion = 500;

int tiempo = 0; 
float comenzar = 10;

Personaje persona; 

ArrayList<Enemigos> enemigos;
int enemigosancho = 50; 
int enemigosalto = 20;

PImage piiso; 




void iniciar()
{
  mundo = new FWorld();
  mundo.setGravity(0, 500);
  //----- PLATAFORMAS QUE VAN CAYENDO ---------

  plataformas = new ArrayList<Plataforma>();

  Plataforma piso = new Plataforma(50, 10);
  piso.inicializar(random(width), random(-10, 0), false);
  //mundo.add(piso);
  //plataformas.add(piso);
  ultimaPlataforma = piso;



  //------ ENEMIGOS ------------- 
  enemigos = new ArrayList<Enemigos>();
}

void lasplataformas()
{

  Plataforma suelo = new Plataforma(width, 10);


  if (frameCount < 2)
  {
    piiso=loadImage ("piso.png");
    suelo.attachImage(piiso);
    suelo.inicializar(width/2, height, true);
    mundo.add(suelo);
    suelo.setName("piso");
    suelo.setStatic(true);
  }

  if (millis() - tiempo  > comenzar)
  {
    /*
    // Verificar si la última plataforma salio de la pantalla y eliminarla
     if (ultimaPlataforma.getY() > height)   
     {
     plataformas.remove(ultimaPlataforma);
     mundo.remove(ultimaPlataforma);
     crearNuevaPlataforma();
     }
     */

    // Controlar el tiempo de creación de las nuevas plataformas
    if (millis() - tiempoCreacion > intervaloCreacion) 
    {
      crearNuevaPlataforma();
      tiempoCreacion = millis();
    }
  }
}


void crearNuevaPlataforma() {

  Plataforma p = new Plataforma(plataformaWidth, plataformaHeight);

  float x = random(width);
  float y = random(0,persona.getY() - 1000);
  p.inicializar(x, y, false);


  // Verificar si ya hay un enemigo en la plataforma
  boolean plataformaConEnemigo = false;
  for (Enemigos enemigo : enemigos) {
    if (enemigo.getX() >= p.getX() && enemigo.getX() <= p.getX() + p.getWidth()) {
      plataformaConEnemigo = true;
      break;
    }
  }

  // Si no hay un enemigo en la plataforma, decide aleatoriamente si agregar un trampolín o enemigo
  if (!plataformaConEnemigo) {


    float probabilidadTrampolin = 0.2; 
    float probabilidadEnemigo = 0.2; 

    if (random(1) < probabilidadTrampolin) {
      Trampolines trampolin = new Trampolines(plataformaWidth - 10, 20);
      trampolin.inicializar(x, y - 20); 
      mundo.add(trampolin);
    } else if (random(1) < probabilidadEnemigo) {
      Enemigos enemigo = new Enemigos(enemigosancho, enemigosalto);
      enemigo.setPlataforma(p);
      enemigo.inicializar(x, y - 20); 
      mundo.add(enemigo);
      enemigos.add(enemigo);
    }

    mundo.add(p);
    plataformas.add(p);
    ultimaPlataforma = p;
    println("SE CREÓ UNA NUEVA PLATAFORMA");
  }
}

/*
void fobjetos()
 {
 if (plataformas.size() > 0) {
 int plataformaAleatoria = (int)random(plataformas.size());
 Plataforma plataformaElegida = plataformas.get(plataformaAleatoria);
 
 // Verificar si ya hay un enemigo en la plataforma
 boolean plataformaConEnemigo = false;
 for (Enemigos enemigo : enemigos) {
 if (enemigo.getX() >= plataformaElegida.getX() && enemigo.getX() <= plataformaElegida.getX() + plataformaElegida.getWidth()) {
 plataformaConEnemigo = true;
 break;
 }
 }
 
 // Si no hay un enemigo en la plataforma, crea uno
 if (!plataformaConEnemigo) {
 float plataformaCentroX = plataformaElegida.getX() + plataformaElegida.getWidth() /2;
 float x = plataformaCentroX - enemigosancho /2 -4;
 float y = plataformaElegida.getY() - enemigosalto;
 Enemigos e = new Enemigos(enemigosancho, enemigosalto);
 e.inicializar(x, y);
 mundo.add(e);
 enemigos.add(e);
 }
 }
 
 }*/
