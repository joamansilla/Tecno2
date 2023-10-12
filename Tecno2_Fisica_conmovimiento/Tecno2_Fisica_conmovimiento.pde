/*
    ------------COMISION----------------------
    MATÍAS
    ------------INTEGRANTES--------------------
    Mansilla Joaquín 
    Ignacio Vallone
    Tomas Vesco
    
    ------VIDEOS--------------------
    https://drive.google.com/drive/folders/1VqX7WsN984MfUHmxWw1Lf8mnbjwOCZOj?hl=es 
*/
import fisica.*;
import ddf.minim.*;

int PUERTO_OSC = 12345;
Receptor receptor;

FWorld mundo;

Minim minim;
AudioPlayer musica;
AudioSample  sonido4, sonido5;

float posY; 

String estado = "juega"; 

int radioElipse = 20;

PImage fondo, perdiste , ganaste;


void setup()
{
  size(500, 10000);
  Fisica.init(this);
  iniciar();

  setupOSC(PUERTO_OSC);
  receptor = new Receptor();

  //-----PERSONAJE--------

  persona = new Personaje(25, 50);
  persona.inicializar(width/2, height - 100);
  mundo.add(persona);

  fondo = loadImage("fondo.png");
  fondo.resize(500, 1000);

  perdiste = loadImage("perdiste.png");
  perdiste.resize(500, 1000);
  
  ganaste = loadImage("ganaste.png");
  ganaste.resize(500, 1000);


  //SONIDO        //Descomentar el sonido de fondo
  minim = new Minim(this);
  musica = minim.loadFile("sonido_fondo.mp3", 1024);
  musica.loop();
  sonido4 = minim.loadSample ("comer.wav");
  sonido5= minim.loadSample ("Salto.wav");
}

void draw()
{

  background(255);
  println("vidas: "+persona.vidas);
  persona.actualizar();

  // condicion de ganar 
  if ( persona.getY() <= 0) 
  {
    estado = "ganaste";
  }

  if (estado.equals("juega") || estado.equals("reinicia") )
  {
    image(fondo, 0, +1 );
    lasplataformas();
    //fobjetos();

    translate( 0,  870 - persona.getY());

    for (int i = 0; i < persona.vidas; i++) 
    {
      float x = 25 + i * (radioElipse * 2 + 20); // Ajustar las coordenadas según tus preferencias
      //float y = 50;
      float y =  persona.getY() - 820; // Puedes ajustar esta coordenada también
      //ellipse(x, y, radioElipse * 2, radioElipse * 2);
      image(loadImage("player.png"), x , y);
    }
    posY = persona.getY();
    println("Altura: " + posY);
    println("VEL: " + persona.getVelocityY());
    
    // Dibuja el personaje utilizando la clase Blob
    receptor.actualizar(mensajes);  
    receptor.dibujarBlobs(width, height);
    
  } else if (estado.equals( "game-over"))
  {

    persona.vidaspersonaje();
    image(perdiste, 0, +1);
    translate(width/2, height/2);
    fill(255, 0, 0);
    textSize(120);
    text( estado, width/2, height/2 );
    stop();
  }

  if (estado == "ganaste")
  {
    image(ganaste, 0, +1);
    translate(width/2, height/2);
    fill(255, 0, 0);
    textSize(120);
    text( estado, width/2, height/2 );
    stop();
  }

  println(estado);
  mundo.step();
  mundo.draw();
}

void keyPressed()
{
  if (key == 'a')
  {
    persona.izqPresionado = true;
  }

  if (key == 'd')
  {
    persona.derPresionado = true;
  }
}

void keyReleased()
{
  if (key == 'a')
  {
    persona.izqPresionado = false;
  }

  if (key == 'd')
  {
    persona.derPresionado = false;
  }
}


void stop()
{
  musica.close(); 
  minim.stop();
  super.stop();
}
