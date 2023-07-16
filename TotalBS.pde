// Initialize the scene to the main scene
int scene = 0;

// The characters!
Character player1, player2;

// Booleans to check the character action keys
boolean player1Jump, player1Left, player1Right = false;
boolean player2Jump, player2Left, player2Right = false;

// Setup the screen and framerate
void setup() {
  fullScreen();
  frameRate(60);
  
  player1 = new Character(25, 50, "right", "red");
  player2 = new Character(width - 75, 50, "left", "blue");
}

void draw() {
  background(20);
  
  // The ground
  fill(100);
  rect(0, height - 50, width, 50);
  
  if (scene == 0) {
    if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height / 2 - 100 && mouseY < height / 2 + 100) {
      fill(80);
    } else {
      fill(100); 
    }
    
    rect(width / 2 - 150, height / 2 - 100, 300, 200);
    
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("PLAY", width / 2, height / 2 - 10);
  } else if (scene == 1) {
    // Here is your character!
    player1.display();
    player2.display();
    
    // Do the character actions based on which keys are pressed
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

void mousePressed() {
  if (scene == 0) {
    if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height / 2 - 100 && mouseY < height / 2 + 100) {
      scene = 1;
    }
  }
}

// Functions to sense which keys are currently pressed down
void keyPressed() {
  if (key == 'w') {
    player1Jump = true;
  } else if (key == 'a') {
    player1Left = true;
  } else if (key == 's') {
    player1.shoot();
  } else if (key == 'd') {
    player1Right = true; 
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      player2Jump = true; 
    } else if (keyCode == LEFT) {
      player2Left = true;
    } else if (keyCode == DOWN) {
      player2.shoot();
    } else if (keyCode == RIGHT) {
      player2Right = true;  
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
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      player2Jump = false; 
    } else if (keyCode == LEFT) {
      player2Left = false;
    } else if (keyCode == RIGHT) {
      player2Right = false;  
    }
  }
}
