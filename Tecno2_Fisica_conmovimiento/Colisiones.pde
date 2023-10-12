void contactStarted(FContact contacto)
{
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();
  if (body1 != null && body2 != null)
  {
    // CONTACTO ENEMIGOS PERSONAJE


    if ((body1.getName() != null && body1.getName().equals("personaje") && body2.getName() != null && body2.getName().equals("enemigo")) ||
      (body1.getName() != null && body1.getName().equals("enemigo") && body2.getName() != null && body2.getName().equals("personaje")))
    {
      Enemigos enemigo;
      Personaje personaje;
      if (body1.getName() != null && body1.getName().equals("enemigo")) {
        enemigo = (Enemigos)body1;
        personaje = (Personaje)body2;
      } else 
      {
        enemigo = (Enemigos)body2;
        personaje = (Personaje)body1;
      }
      // Eliminar enemigo
      println("CONTACTO CON ENEMIGO");
      mundo.remove(enemigo.getP());
      plataformas.remove(enemigo.mp);
      mundo.remove(enemigo);
      enemigos.remove(enemigo);
       sonido4.trigger();
      crearNuevaPlataforma();

      
      // El personaje está por encima de la plataforma, aplicar impulso hacia arriba.
      //float peso = 3500.0; // Ajusta la magnitud del impulso
      personaje.caer();
      //personaje.setVelocity(personaje.getVelocityX(), peso);
    }
    
          if(persona.vidas<=0)
      {
        estado="game-over";
      }

    // CONTACTOS PLATAFORMAS Y PERSONAJE
    if ( ( body1.getName() != null && body1.getName().equals("personaje") && body2.getName() != null && body2.getName().equals("plataforma") ) ||
      ( body1.getName() != null && body1.getName().equals("plataforma") && body2.getName() != null && body2.getName().equals("personaje") )  )
    {
      FBody plataforma;
      FBody personaje;
      if (body1.getName() != null && body1.getName().equals("plataforma")) {
        plataforma = body1;
        personaje = body2;
        
      } else 
      {
        plataforma = body2;
        personaje = body1;
       
      }
      // Eliminar la plataforma del mundo 
      mundo.remove(plataforma);
      plataformas.remove(plataforma);
      crearNuevaPlataforma();
      // Verificar que el personaje esté por encima de la plataforma.
      float plataformaY = plataforma.getY();
      float personajeY = personaje.getY();
      if (personajeY  < plataformaY) 
      {
        
        sonido5.trigger();

        // El personaje está por encima de la plataforma, aplicar impulso hacia arriba.
        float impulsoY = -1250.0; // Ajusta la magnitud del impulso 
        personaje.setVelocity(personaje.getVelocityX(), impulsoY);
      }
    }




    // CONTACTOS TRAMPOLINES Y PERSONAJE
    if ( ( body1.getName() != null && body1.getName().equals("personaje") && body2.getName() != null && body2.getName().equals("trampolin") ) ||
      ( body1.getName() != null && body1.getName().equals("trampolin") && body2.getName() != null && body2.getName().equals("personaje") )  )
    {
      FBody trampolin;
      FBody personaje;
      
      if (body1.getName() != null && body1.getName().equals("trampolin")) {
        trampolin = body1;
        personaje = body2;
      } else 
      {
        trampolin = body2;
        personaje = body1;
      }
      // Eliminar el trampolin del mundo físico.
      mundo.remove(trampolin);
      plataformas.remove(trampolin);

      // Verificar que el personaje esté por encima del trampolin.
      float trampolinY = trampolin.getY();
      float personajeY = personaje.getY();
      if (personajeY  < trampolinY) 
      {
        sonido5.trigger();
        // Si el personaje está por encima del trampolin, aplica un impulso hacia arriba.
        float impulsoY = -3500.0; 
        personaje.setVelocity(personaje.getVelocityX(), impulsoY);
      }
    }

    // CONTACTO ENTRE PLATAFORMAS Y EL PISO 
    if ((body1.getName() != null && body1.getName().equals("piso") && body2.getName() != null && body2.getName().equals("plataforma")) ||
      (body1.getName() != null && body1.getName().equals("plataforma") && body2.getName() != null && body2.getName().equals("piso")))

    {
      FBody piso;
      FBody plataforma; 
      if ( body1.getName() != null && body1.getName().equals("plataforma") )
      {
        plataforma = body1;
        piso = body2;
      } else
      {
        plataforma = body2;
        piso = body1;
      }
      //Eliminar las plataformas que tocan el suelo 
      mundo.remove(plataforma);
      plataformas.remove(plataforma);
      crearNuevaPlataforma();
    }

    // CONTACTO ENTRE ENEMIGOS Y EL PISO 

    if ((body1.getName() != null && body1.getName().equals("piso") && body2.getName() != null && body2.getName().equals("enemigo")) ||
      (body1.getName() != null && body1.getName().equals("enemigo") && body2.getName() != null && body2.getName().equals("piso")))

    {
      FBody piso;
      FBody enemigo; 
      if ( body1.getName() != null && body1.getName().equals("enemigo") )
      {
        enemigo = body1;
        piso = body2;
      } else
      {
        enemigo = body2;
        piso = body1;
      }
      //Eliminar los enemigos que tocan el suelo 
      mundo.remove(enemigo);
      plataformas.remove(enemigo);
    }


    // CONTACTO ENTRE TRAMPOLINES Y EL PISO 

    if ((body1.getName() != null && body1.getName().equals("piso") && body2.getName() != null && body2.getName().equals("trampolin")) ||
      (body1.getName() != null && body1.getName().equals("trampolin") && body2.getName() != null && body2.getName().equals("piso")))

    {
      FBody piso;
      FBody trampolin; 
      
      if ( body1.getName() != null && body1.getName().equals("plataforma") )
      {
        trampolin = body1;
        piso = body2;
      } else
      {
        trampolin = body2;
        piso = body1;
        
        
      }
      //Eliminar los trampolines que tocan el suelo 
      mundo.remove(trampolin);
      plataformas.remove(trampolin);
       
    }
  }
}
