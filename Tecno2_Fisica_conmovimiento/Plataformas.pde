class Plataforma extends FBox
{
  Plataforma(float _w, float _h)
  {
    super(_w , _h);
  }
  
  void inicializar(float _x , float _y , boolean _piso)
  {
    setPosition(_x,_y);
    setName("plataforma");
    setRotatable(false);

    //setDensity(15);
    setFriction(0);
    setDamping(2);
    adjustVelocity(0, 20);
    if (!_piso){
    attachImage(loadImage("plataforma.png"));
  }
  }
}
