// Initialize the scene to the main scene
int scene = 0;

// The characters!
Character player1 = new Character(10, 50, "right", "red");

// Booleans to check the character action keys
boolean player1Jump, player1Shoot, player1Left, player1Right;
boolean player2Jump, player2Shoot, player2Left, player2Right;

// Setup the screen and framerate
void setup() {
  fullScreen();
  frameRate(60);  
}

void draw() {
  background(20);
  
  // The ground
  fill(100);
  rect(0, height - 50, width, 50);
  
  // Here is your character!
  player1.display();
  
  // Do the character actions based on which keys are pressed
  if (player1Jump) {
    player1.jump();
  }
  
  if (player1Left) {
    player1.move("left"); 
  }
  
  if (player1Shoot) {
     
  }
  
  if (player1Right) {
    player1.move("right"); 
  }
}

// Functions to sense which keys are currently pressed down
void keyPressed() {
  if (key == 'w') {
    player1Jump = true;
  } else if (key == 'a') {
    player1Left = true;
  } else if (key == 's') {
    player1Shoot = true;
  } else if (key == 'd') {
    player1Right = true; 
  }
}

void keyReleased() {
  if (key == 'w') {
    player1Jump = false;
  } else if (key == 'a') {
    player1Left = false;
  } else if (key == 's') {
    player1Shoot = false;
  } else if (key == 'd') {
    player1Right = false; 
  }
}
