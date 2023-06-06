PFont font;

PImage main_screen_art, play_scene_art, settings_scene_art, credits_scene_art;

Knight player1;
Archer_1 player2;

Button buttonMenu, buttonPlay, buttonSetting, buttonCredits, buttonInferno, buttonGlacier, buttonForest;

InfernoPlatform infernoPlatform;
GlacierPlatform glacierPlatform;
ForestPlatform forestPlatform;
InfernoPlatform[] infernoLevel;
GlacierPlatform[] glacierLevel;
ForestPlatform[] forestLevel;

boolean player1Jump, player1Shoot, player1Right, player1Left;
boolean player2Jump, player2Shoot, player2Right, player2Left;

int scene = 0;
protected boolean debug = true;

void setup() {

  fullScreen();
  frameRate(60);

  System.out.println(this.getClass());
  
  font = createFont("font.ttf", 64);
  
  imageMode(CENTER);

  player1 = new Knight(100, 200, this, 0);
  player2 = new Archer_1(width - 100, 200, this, 1);

  //player1 = new Mage(200, 200, this);
  //player2 = new Archer_1(300, 200, this);
  
  buttonMenu = new Button(50, 50, 350, 100, "Return", 0);
  buttonPlay = new Button(width / 2 - 350, height / 2, "Play", 1);
  buttonSetting = new Button(width / 2 - 350, height / 2 + 150, "Settings", 2);
  buttonCredits = new Button(width / 2 - 350, height / 2 + 300, "Credits", 3);
  
  buttonInferno = new Button(width / 2 - 350, height / 2, "Inferno", 4);
  buttonGlacier = new Button(width / 2 - 350, height / 2 + 150, "Glacier", 5);
  buttonForest = new Button(width / 2 - 350, height / 2 + 300, "Forest", 6);
  
  infernoPlatform = new InfernoPlatform(500, 500);
  glacierPlatform = new GlacierPlatform(500, 500);
  forestPlatform = new ForestPlatform(500, 500);
  
  // Inferno level
  infernoLevel = new InfernoPlatform[8];
  infernoLevel[0] = new InfernoPlatform(width - 400, height - 200);
  infernoLevel[1] = new InfernoPlatform(width - 1600, height - 200);
  infernoLevel[2] = new InfernoPlatform(width - 1130, height - 400);
  infernoLevel[3] = new InfernoPlatform(width - 850, height - 400);
  infernoLevel[4] = new InfernoPlatform(width - 1600, height - 600);
  infernoLevel[5] = new InfernoPlatform(width - 400, height - 600);
  infernoLevel[6] = new InfernoPlatform(width - 850, height - 800);
  infernoLevel[7] = new InfernoPlatform(width - 1130, height - 800);
  
  // Glacier level
  glacierLevel = new GlacierPlatform[9];
  glacierLevel[0] = new GlacierPlatform(width - 400, height - 250);
  glacierLevel[1] = new GlacierPlatform(width - 1250, height - 200);
  glacierLevel[2] = new GlacierPlatform(width - 1530, height - 200);
  glacierLevel[3] = new GlacierPlatform(width - 950, height - 450);
  glacierLevel[4] = new GlacierPlatform(width - 1500, height - 650);
  glacierLevel[5] = new GlacierPlatform(width - 2000, height - 400);
  glacierLevel[6] = new GlacierPlatform(width - 120, height - 700);
  glacierLevel[7] = new GlacierPlatform(width - 400, height - 700);
  glacierLevel[8] = new GlacierPlatform(width - 950, height - 850);
  
  // Forest Level
  forestLevel = new ForestPlatform[14];
  forestLevel[0] = new ForestPlatform(width + 140, height - 200);
  forestLevel[1] = new ForestPlatform(width - 2060, height - 200);
  forestLevel[2] = new ForestPlatform(width - 550, height - 135);
  forestLevel[3] = new ForestPlatform(width - 830, height - 135);
  forestLevel[4] = new ForestPlatform(width - 1110, height - 135);
  forestLevel[5] = new ForestPlatform(width - 1390, height - 135);
  forestLevel[6] = new ForestPlatform(width - 1600, height - 400);
  forestLevel[7] = new ForestPlatform(width - 2060, height - 550);
  forestLevel[8] = new ForestPlatform(width - 970, height - 300);
  forestLevel[9] = new ForestPlatform(width - 60, height - 450);
  forestLevel[10] = new ForestPlatform(width - 340, height - 450);
  forestLevel[11] = new ForestPlatform(width + 140, height - 750);
  forestLevel[12] = new ForestPlatform(width - 970, height - 550);
  forestLevel[13] = new ForestPlatform(width - 2060, height - 830);
  textFont(font);
}

void draw() {
  if (scene == 0) {
    background(100);
    
    fill(0);
    buttonPlay.hoverChangeColor();
    buttonSetting.hoverChangeColor();
    buttonCredits.hoverChangeColor();
    
    fill(255);
  } else if (scene == 1) {
    background(100);
    
    buttonMenu.hoverChangeColor();
    buttonInferno.hoverChangeColor();
    buttonGlacier.hoverChangeColor();
    buttonForest.hoverChangeColor();
    
    fill(255);
  } else if (scene == 2) {
    background(100);
  } else if (scene == 3) {
    background(100);
    
    fill(0);
    rect(width / 2 - 300, height / 2 - 200, 600, 550, 100);
    
    fill(255);
    
    text("Creators:", width / 2, height / 2 - 100);
    text("Jovian Kuntjoro", width / 2, height / 2);
    text("Jeremy Wu", width / 2, height / 2 + 100);
    text("Nathan Rajkumar", width / 2, height / 2 + 200);
  } else if (scene == 4) {
    background(100, 0, 0);

    infernoPlatform.displayBoundary();

    System.out.println("Before InfernoLevel Loop");
    System.out.println(infernoLevel.length);
    
    for (InfernoPlatform platform : infernoLevel) {
      platform.display();
    }
    
    System.out.println("After infernoLevel Loop");

  } else if (scene == 5) {
  	background(0, 100, 150);
      
    glacierPlatform.displayBoundary();
    
    for (GlacierPlatform platform : glacierLevel) {
      platform.display();
    }
  } else if (scene == 6) {
    background(0, 100, 0);
    

    forestPlatform.displayBoundary();
    
    for (ForestPlatform platform : forestLevel) {
      platform.display();
    }
  }
  
  if (scene > 3 && scene < 7) {
    player1.display();
    player2.display();
    
    if (player1Jump) {
      player1.jump();
    }
    
    if (player1Left) {
      player1.move("left"); 
    }
    
    if (player1Right) {
      player1.move("right"); 
    }
    
    if (player2Jump) {
      player2.jump();
    }
    
    if (player2Left) {
      player2.move("left"); 
    }
    
    if (player2Right) {
      player2.move("right"); 
    }
  }
}

void mouseClicked() {
  if (scene == 0) {
    if (buttonPlay.isMouseClicked(scene) != scene) {
      scene = buttonPlay.isMouseClicked(scene);
    } else if (buttonSetting.isMouseClicked(scene) != scene){
      scene = buttonSetting.isMouseClicked(scene);
    } else if (buttonCredits.isMouseClicked(scene) != scene) {
      scene = buttonCredits.isMouseClicked(scene);
    }
  } else if (scene == 1) {
    if (buttonInferno.isMouseClicked(scene) != scene) {
      scene = buttonInferno.isMouseClicked(scene);
    } else if (buttonGlacier.isMouseClicked(scene) != scene){
      scene = buttonGlacier.isMouseClicked(scene);
    } else if (buttonForest.isMouseClicked(scene) != scene) {
      scene = buttonForest.isMouseClicked(scene);
    } else if(buttonMenu.isMouseClicked(scene) != scene) {
      scene = buttonMenu.isMouseClicked(scene);
    }
  } else if (scene == 2) {
  } else if (scene == 3) {
  } else if (scene == 4) {
    if (buttonMenu.isMouseClicked(scene) != scene) {
      scene = buttonMenu.isMouseClicked(scene);
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    player1Jump = true;
  } else if (key == 'a') {
    player1Left = true; 
  } else if (key == 'd') {
    player1Right = true; 
  } else if (key == 's') {
    player1Shoot = true; 
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      player2Jump = true;
    } else if (keyCode == LEFT) {
      player2Left = true; 
    } else if (keyCode == RIGHT) {
      player2Right = true; 
    } else if (keyCode == DOWN) {
      player2Shoot = true; 
    }
  }
  
  if (keyCode == 8) {
    if (scene >= 4 && scene <= 6) {
      scene = 1; 
    }
  }
}

void keyReleased() {
  if (key == 'w') {
    player1Jump = false;
  } else if (key == 'a') {
    player1Left = false; 
  } else if (key == 'd') {
    player1Right = false; 
  } else if (key == 's') {
    player1Shoot = false; 
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      player2Jump = false;
    } else if (keyCode == LEFT) {
      player2Left = false; 
    } else if (keyCode == RIGHT) {
      player2Right = false; 
    } else if (keyCode == DOWN) {
      player2Shoot = false; 
    }
  }
}
