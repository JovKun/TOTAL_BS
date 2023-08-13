// Import necessary modules
import java.util.ArrayList;

// Initialize the scene to the main scene
int scene = 0;

// Declare the players
Character player1, player2;

// Declare platforms and the platform array
ArrayList<Platform> platformArray = new ArrayList<Platform>();

// Booleans to check the character action keys
boolean player1Jump, player1Left, player1Right = false;
boolean player2Jump, player2Left, player2Right = false;

boolean deathAnimationPlayed = false;

// Setup the screen and framerate
void setup() {
  fullScreen();
  frameRate(60);
  
  // Initialize the level
  platformArray.add(new Platform(width / 2 - 250, height - 300, 500));
  platformArray.add(new Platform(0, height - 550, 600));
  platformArray.add(new Platform(width - 600, height - 550, 600));
  platformArray.add(new Platform(width / 2 - 125, height - 700, 250));
  platformArray.add(new Platform(200, height - 900, 500));
  platformArray.add(new Platform(width - 700, height - 900, 500));
  
  // Initialize the characters
  player1 = new Character(25, 50, "right", "red", platformArray);
  player2 = new Character(width - 75, 50, "left", "blue", platformArray);
}

void draw() {
  background(20);
  
  // The ground
  fill(100);
  rect(0, height - 50, width, 50);
  
  if (scene == 0) {
    
    // Colour the button based on if the mouse if hovering over it or not
    if (mouseX > width / 2 - 150 && mouseX < width / 2 + 150 && mouseY > height / 2 - 100 && mouseY < height / 2 + 100) {
      fill(80);
    } else {
      fill(100); 
    }
    
    // Draw the button
    rect(width / 2 - 150, height / 2 - 100, 300, 200);
    
    // Draw the text inside the button
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(100);
    text("PLAY", width / 2, height / 2 - 10);
  } else {
    
    // Only run this code if the game is still running
    if (!player1.ifDead() && !player2.ifDead()) {
      
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
    } else {
      fill(200);
      textAlign(CENTER, CENTER);
      textSize(100);
      
      // Play the death animation for the character that died
      if (player1.ifDead()) {
        if (!deathAnimationPlayed) {
          player1.setVelocityY(-20);
          player1.setGroundHeight(-100);
          
          deathAnimationPlayed = true;
        }
        
        // Game over text
        fill(35, 35, 255);
        
        text("BLUE WINS", width / 2, height / 2 - 10);
      } else if (player2.ifDead()) {
        if (!deathAnimationPlayed) {
          player2.setVelocityY(-20);
          player2.setGroundHeight(-100);
          
          deathAnimationPlayed = true;
        }
        
        // Game over text
        fill(255, 35, 35);
        
        text("RED WINS", width / 2, height / 2 - 10);
      }
    }
    
    // Draw the characters
    player1.display(player2);
    player2.display(player1);
    
    // Draw all the platforms
    for (int platformIndex = 0; platformIndex < platformArray.size(); platformIndex++) {
      platformArray.get(platformIndex).display(); 
    }
  }
}

// Method to determine any presses on the "play" button
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
    if (!player1.ifDead() && !player2.ifDead()) {
      player1.shoot();  
    }
  } else if (key == 'd') {
    player1Right = true; 
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      player2Jump = true; 
    } else if (keyCode == LEFT) {
      player2Left = true;
    } else if (keyCode == DOWN) {
      if (!player1.ifDead() && !player2.ifDead()) {
        player2.shoot(); 
      }
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
