class Trampolines extends FBox
{
  PImage trampolin1; 
  
  Trampolines (float _w , float _h) 
  {
    super ( _w , _h);
  }
  
  void inicializar(float _x , float _y)
  {
    setFill(0,255,0);
    setPosition(_x ,_y);
    setName("trampolin");
    setRotatable(false);
    setDamping(1.9);
    setFriction(0);
    adjustVelocity(0,20);
    trampolin1 =loadImage ("trampolin1.png");
    trampolin1.resize(50,55);
    attachImage(trampolin1);
  }
}
