class Enemigos extends FBox {
  
  int afectaSalto; //Controla cómo afecta el enemigo al salto del pj.
  Plataforma mp;
  
  PImage enemiigos;
  
  Enemigos(float _w, float _h)
  {
    super(_w, _h);
  }

  void inicializar(float _x, float _y)
  {
    setFill(255, 0, 0);
    setPosition(_x, _y);
    setName("enemigo");
    setRotatable(false);
    setDamping(1.9);
    setFriction(0);
    adjustVelocity(0, 20);
    //setSensor(true);
    enemiigos=loadImage ("enemigo.png");
    enemiigos.resize(70, 50);
    
    attachImage(enemiigos);
    
  }

  void setPlataforma(Plataforma p) {
    mp = p;
  }

  Plataforma getP() {
    return mp;
  }
  
}
