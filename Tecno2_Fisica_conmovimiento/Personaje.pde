class Personaje extends FBox
{
  Boolean izqPresionado, derPresionado ;

  int velocidad;
  boolean tengoQueCaer;
  
  boolean cayendo; 
  
  int vidas = 3; 
  
  PImage player,player2;
  
  Personaje(float _w, float _h)
  {
    super(_w, _h);
  }

  void caer() {
    tengoQueCaer = true;
  }

  void inicializar(float _x, float _y)
  {
    velocidad = 500;

    izqPresionado = false;
    derPresionado = false; 

    setName("personaje");
    setPosition(_x, _y);
    setRotatable(false);
    setRestitution(5);
    setStatic(false);
    player=loadImage ("player.png");
    attachImage(player);
  }

  void actualizar()
  {
    cambiarimagen();
    if (tengoQueCaer) {
      float peso = 3500.0; //Ajuste de impulso 
      setVelocity(getVelocityX(), peso);
      tengoQueCaer = false;
      vidas--;
    }
    if (izqPresionado)
    {
      setVelocity( -velocidad, getVelocityY() );
    }

    if ( derPresionado )
    {
      setVelocity(velocidad, getVelocityY() );
    }

    if (!izqPresionado && !derPresionado)
    {
      setVelocity(0, getVelocityY() );
    }
    
    if (persona.getY() == 0){
      
    }
  }
  
  void vidaspersonaje ()
  {
    if (vidas == 3)
    {
      estado = "juega"; 
    }else if (vidas <= 0)
    {
      estado = "game-over";
    } 

  }
  
  void cambiarimagen()
  {
    if(getVelocityY() >=0 )
    {
      player=loadImage ("player.png");
      attachImage(player);
    }
    else if(getVelocityY() <=0)
    {
      player2=loadImage ("player2.png");
      attachImage(player2);
    }
  }
  
}
