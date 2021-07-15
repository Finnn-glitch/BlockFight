void draw()
{
  //STARTSCREEN
  if (status==0 )
  {  
    if (mousePressed && mouseX>100 && mouseX<300 && mouseY>10 && mouseY<60 && player_character_client !=0)
    {
      status = 1;
      background(255);
      heal_client = 100000;
      if (!clientRunning)
      {
        c = new Client(this, ip_connect, 4444); // starte den Client
        clientRunning = true;
      }
    }
    //Background
    image(Background_Start, 0, 0);

    //  abfrage für vorschau  
    if (mousePressed && mouseX>175 && mouseX<225 && mouseY>400 && mouseY<450)
    {
      player_character_client = 1;
    }
    if (mousePressed && mouseX>100 && mouseX<150 && mouseY>400 && mouseY<450)
    {
      player_character_client = 2;
    }

    if (mousePressed && mouseX>250 && mouseX<300 && mouseY>400 && mouseY<450)
    {
      player_character_client = 3;
    }

    //Menu button
    if (mousePressed && mouseX>1800 && mouseX<1900 && mouseY>100 && mouseY<200)
    {
      status=2;
    }

    textSize(19);
    fill(#03F9FF);
    rect(100, 700, 100, 50);
    fill(#6A6262);
    text("Localhost", 105, 730);

    if (mousePressed && mouseX>100 && mouseX<200 && mouseY>700 && mouseY<750)
    {
      ip_connect = "localhost";
    }

    fill(#03F9FF);
    rect(100, 800, 100, 50);
    fill(#6A6262);
    text("Custom IP", 105, 830);
    textSize(12);

    if (mousePressed && mouseX>100 && mouseX<200 && mouseY>800 && mouseY<850)
    {
      status = 50;
    }

    //  vorschau mainscreen
    fill(255);
    textSize(22);
    text("Character auswahl", 110, 150);
    textSize(12);

    //Default  IMAGE
    if (  player_character_client== 1)
    {
      fill(#FAAB00);
      ellipse(200, 230, 64, 64);
      fill(255);
      fill(0);
    }
    //Mario
    if ( player_character_client == 2)
    {
      image(Mario_character, 175, 200);
    }
    //Luigi
    if ( player_character_client == 3)
    {
      image(Luigi_character, 175, 200);
    }


    //Namen Text Feld
    switch (state) {
    case 0:
      fill(0); 
      textSize(32);
      text("Gib deinem charakter einen namen \n" + ": "+player_name_client, 600, 100);
      textSize(12);
      noFill();
      break;
    case 1:
      fill(255, 2, 2); 
      textSize(32);
      text ("Dein name ist \n"+":"+player_name_client, 600, 100); 
      textSize(12);
      fill(0);
      noFill();
      break;
    }

    textSize(22);
    text("!!Du darfst nur 8 Buchstaben / Zahlen verwenden!!", 620, 200);
    textSize(12);

    //Server Start button
    fill(#00E7FA);
    rect(100, 10, 200, 40);
    fill(0);
    text("Joine Multiplayer Session", 120, 35);
    noFill();

    //Mario select button
    fill(#F50A0A);
    rect(100, 400, 50, 50);
    fill(0);
    text("Mario", 110, 430);
    noFill();

    //Luigi select button
    fill(#08FA4E);
    rect(250, 400, 50, 50);
    fill(0);
    text("Luigi", 260, 430);
    noFill();

    //Default select button
    fill(#FFB108);
    rect(175, 400, 50, 50);
    fill(0);
    text("Balli", 185, 430);
    noFill();

    //Menu
    fill(#FF1F1F);
    image(menu, 1800, 100);
    fill(0);
    textSize(32);
    fill(#05C7FF);
    text("Menü", 1805, 100);
    fill(0);
    textSize(12);


    if (!Startmusik.isPlaying() && soundon == true) 
    {
      Startmusik.play();
    }
    if (soundon == false)
    {
      Startmusik.stop();
    }

    //IP Show 
    textSize(20);

    text("IP : " + Server.ip(), 100, 600);
    text("IP connect zum server : " + ip_connect, 100, 650);
    textSize(12);
  }      
  //MAIN GAME---------------------------MAINGAME--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

  if (status==1)
  {  
    image(backgroundgame, 0, 0);
    Startmusik.stop();

    //BOARDER
    noFill();
    strokeWeight(4);
    rect(110, 100, 1540, 900);
    strokeWeight(1);

    //Player SHOW INGAME--CLIENT------------
    if (player_character_client == 1)
    {
      fill(#FAAB00);
      ellipse(client_x, client_y, 64, 64);
      fill(255);
      noFill();
    }
    if (player_character_client== 2)
    {
      image(Mario_character, client_x-20, client_y-20);
    }
    if (player_character_client == 3)
    {
      image(Luigi_character, client_x-20, client_y-20);
    }

    //Player SHOW INGAME--SERVER------------    

    if (player_character_server == 1 && status_server == 1)
    {
      fill(#FAAB00);
      ellipse(server_x, server_y, 64, 64);
      fill(255);
      noFill();
    }
    if (player_character_server== 2 && status_server == 1)
    {
      image(Mario_character, server_x-20, server_y-20);
    }
    if (player_character_server == 3 && status_server == 1)
    {
      image(Luigi_character, server_x-20, server_y-20);
    }
    //debug
    if (debug == true)
    {
      rect(server_x-5, server_y-5, 10, 10);
      rect(client_x-5, client_y-5, 10, 10);
    }
    // TEXT ZEICHNEN CLIENT
    if (player_character_client !=0)
    {
      fill(0, 0, 0);
      textSize(22);
      text(player_name_client, client_x-10, client_y-20);
      textSize(12);
    }
    // TEXT ZEICHNEN SERVER
    if (player_character_server !=0)
    {
      fill(0, 0, 0);
      textSize(22);
      text(player_name_server, server_x-10, server_y-20);
      textSize(12);
    }
    //MINIMAP
    fill(#766D6D);
    rect(1699, 19, 201, 201);
    fill(#870CF5);
    image(backgroundminimap, 1700, 20);
    ellipse(client_x/9.6+1700, client_y/5.4+20, 16, 16);
    fill(#FF0303);
    ellipse(server_x/9.6+1700, server_y/5.4+20, 16, 16);
    noFill();

    //Heal Bar
    fill(#1BF078);
    //player_heal
    rect(100, 30, heal_client/500, 10);
    noFill();
    if (player_character_server !=0 && status_server == 1)
    {
      fill(#FF1A12);
      rect(server_x -30, server_y -50, heal_server/1000, 10);
      noFill();
    }
    if (heal_client <= 100)
    {
      status = 4;
      player_character_client = 0;
      heal_client = 100000;
    }
    if (heal_server <= 100)
    {
      player_character_server = 0;
      heal_server = 100000;
      points++;
    }

    // Punktesystem
    textSize(20);
    text(points, 400, 50);
    textSize(12);

    //Menu
    fill(#FF1F1F);
    image(menu, 10, 980);
    menu.resize(0, 50);
    fill(0);
    textSize(22);
    fill(255);
    text("Menü", 10, 980);
    fill(0);
    textSize(12);
    //button trigger menu ingame
    if (mousePressed && mouseX>10 && mouseX<60 && mouseY>980 && mouseY<1030)
    {
      menu_ingame = true;
    }

    //TRY TO ENABLE SHOOTINGS
    //ENABLE SHOOTINGS SERVER SIDE

    mouseX_client = mouseX;
    mouseY_client = mouseY;

    for (int n=0; n<50; n++)
    {
      fill(50);
      ellipse(KugelX_server[n], KugelY_server[n], 10, 10);
      KugelX_server[n] += cos(radians(KugelRichtung_server[n]))*5;
      KugelY_server[n] += sin(radians(KugelRichtung_server[n]))*5;
      //abstand von kugel berechnen und leben abziehen
      for (int i=0; i<50; i++)
      {
        if (abstand(x_client[i], y_client[i], KugelX_client[n], KugelY_client[n]) < 60 && player_character_server !=0)  
        {
          heal_server = heal_server -1;
        }
      }
    }
    for (int n=0; n<50; n++)

    {
      x_client[n] = server_x;
      y_client[n] = server_y;
    }
    if (mousepressed_server == 1 && player_character_server !=0)   
    {       
      KugelX_server[nummer_server] = server_x+25;       
      KugelY_server[nummer_server] = server_y+25;             
      KugelRichtung_server[nummer_server] = richtungMaus_server(server_x, server_y);  
      nummer_server = (nummer_server+1)%50;
    }

    // ENABLE SHOOTINGS CLIENT
    for (int n=0; n<50; n++)
    {
      fill(50);
      ellipse(KugelX_client[n], KugelY_client[n], 10, 10);
      KugelX_client[n] += cos(radians(KugelRichtung_client[n]))*5;
      KugelY_client[n] += sin(radians(KugelRichtung_client[n]))*5;
    }
    if (mousepressed_client == 1 && player_character_client !=0)   
    {       
      KugelX_client[nummer_client] = client_x+25;
      KugelY_client[nummer_client] = client_y+25;
      KugelRichtung_client[nummer_client] = richtungMaus_client(client_x, client_y);      
      nummer_client = (nummer_client+1)%50;
    }
    //Gun
    if (status_server == 1)
    {
      spielerZeichnen_server(server_x+25, server_y+25);
    }
    spielerZeichnen_client(client_x+25, client_y+25);
  }  
  //Menu------------------------STARTSCREEN----------------MENUUUUUUU-----------------------------
  if (status==2)
  {
    image(Background_Start, 0, 0);
    fill(255);
    rect(810, 390, 300, 300);
    fill(0);
    textSize(22);
    text("MENÜ", 920, 430);
    fill(0);
    textSize(12);  


    //SOUNDBUTTON true or false
    rect(840, 450, 49, 49);
    if (buttonCooldown > 0) buttonCooldown --;
    if ( mousePressed && mouseX>840 && mouseX<890 && mouseY>450 && mouseY<500 && buttonCooldown == 0)
    {
      buttonCooldown = 30;
      if (soundon == true)
      {
        soundon=false;
      } else if (soundon == false)
      {
        soundon=true;
      }
    }
    if (soundon==true)
    {
      image(y, 840, 450);
      fill(0);
      textSize(18);
      text("Musik ist AN!", 910, 480);
      textSize(12); 
      if (!Startmusik.isPlaying()) 
      {
        Startmusik.play();
      }
    }
    if (soundon==false)
    {
      image(x, 840, 450);
      fill(0);
      textSize(18);
      text("Musik ist AUS!", 910, 480);
      textSize(12);
      Startmusik.stop();
    }
    //buton exit
    fill(#0FDBCC);
    rect(1040, 630, 50, 50);
    fill(0);
    textSize(14);
    text("Zurück", 1040, 660);
    textSize(12);
    //button trigger
    if (mousePressed && mouseX>1040 && mouseX<1090 && mouseY>630 && mouseY<680)
    {
      status = 0;
    }
  }
  //Menu ingame;

  if (menu_ingame)
  {
    fill(255);
    rect(810, 390, 300, 300);
    fill(0);

    textSize(22);
    text("MENÜ", 920, 430);
    fill(0);
    textSize(12);  

    //buton exit
    fill(#0FDBCC);
    rect(1040, 630, 50, 50);
    fill(0);
    textSize(14);
    text("Zurück", 1040, 660);
    textSize(12);

    if (mousePressed && mouseX>1040 && mouseX<1090 && mouseY>630 && mouseY<680)
    {
      menu_ingame = false;
    }
    //reconnect
    fill(255);
    rect(840, 450, 49, 49);
    fill(0);

    //reconnect abfrage
    if (clientRunning == true)
    {
      image(y, 840, 450);
      fill(0);
      textSize(18);
      text("Client ist ON!", 910, 480);
      textSize(12);
    }
    if (clientRunning == false)
    {
      image(x, 840, 450);
      fill(0);
      textSize(18);
      text("Client ist OFF!", 910, 480);
      textSize(12);
    }
    if (debug == true)
    {
      if (buttonCooldown > 0) buttonCooldown --;
      if (mousePressed && mouseX>840 && mouseX<890 && mouseY>450 && mouseY<500 && buttonCooldown == 0)
      {
        buttonCooldown = 30;
        if (clientRunning == true)
        {
          clientRunning = false;
        } else if (clientRunning== false)
        {
          clientRunning=true;
        }
      }
    }
  }
  //-----------LOOSING SCREEN----------------------------------------------------------
  if (status == 4)
  {
    points = 0;
    image(Background_Start, 0, 0);
    fill(#391A7C);
    rect(300, 300, 200, 50);
    textSize(15);
    fill(0);
    text("Click here to Respawn", 300, 350);
    textSize(12);
    state = 0;
    noFill();
    if (mousePressed && mouseX>300 && mouseX<500 && mouseY>300 && mouseY<350)
    {
      status = 0;
      clientRunning = false;
      player_character_client = 0;
      heal_server = 100000;
      heal_client = 100000;
    }
  }
  //-----------------------------------------------------------------------------------------------------------

  if (status == 50)
  {
    background(#C7D8FC);

    switch (state_ip) {
    case 0:
      fill(0); 
      textSize(32);
      text("IP ADRESSE von Server \n" + ": "+ip_connect, 600, 100);
      textSize(12);
      noFill();
      break;
    case 1:
      fill(#54C3CB); 
      textSize(32);
      text ("Selected \n"+":"+ip_connect, 600, 100); 
      textSize(12);
      fill(0);
      noFill();
    }

    fill(#FFFFFF);
    rect(300, 300, 50, 50);
    fill(0);
    textSize(15);
    text("Exit", 310, 325);
    textSize(12);

    if (mousePressed && mouseX>300 && mouseX<350 && mouseY>300 && mouseY<350)
    {
      status = 0;
    }
  }

  if (clientRunning)
  {
    datenLesenClient();
    if (taste[0] && client_y>100) {
      client_y= client_y-5*(60/frameRate);
    }
    if (taste[1] && client_x>110) {
      client_x= client_x-5*(60/frameRate);
    }
    if (taste[2] && client_y<1000) {
      client_y= client_y+5*(60/frameRate);
    }
    if (taste[3] && client_x<1650) {
      client_x= client_x+5*(60/frameRate);
    }
    datenSchreibenClient();
  }

  //DEBUG MODE
  if (debug == true && status == 1)
  {
    fill(#FF0000);
    text(frameRate, 1600, 20);
    text(frameCount, 1600, 40);
    text(server_x, 1300, 20);
    text(server_y, 1400, 20);   
    text(mouseX_server, 1200, 20);
    text(mouseY_server, 1100, 20);
    text(heal_server, 1000, 20);
    text(status, 900, 20);

    text(client_x, 1300, 40);
    text(client_y, 1400, 40);   
    text(mouseX_client, 1200, 40);
    text(mouseY_client, 1100, 40);
    text(heal_client, 1000, 40);
    fill(0);
  }

  fill(#00F4FF);
  ellipse(mouseX, mouseY, 10, 10);
}
