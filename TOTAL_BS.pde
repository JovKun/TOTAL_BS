int buttonWidth = 750;
int buttonHeight = 100;

// Button Variables:
int buttonX;
int buttonY;

PFont font;

void setup() {
  fullScreen();
  
  buttonX = width / 2 - buttonWidth / 2;
  buttonY = height / 2 - buttonHeight / 2;
  
  font = createFont("font.ttf", 64);
}

void draw() {
  background(200);
  
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth && mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
    fill(80);
  } else {
    fill(100);
  }
  
  rect(buttonX, buttonY, buttonWidth, buttonHeight);
  rect(buttonX, buttonY + 150, buttonWidth, buttonHeight);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight);
  
  fill(255);
  textFont(font);
  text("PLAY", width / 2 - 85, height / 2 + 18);
  text("SETTINGS", width / 2 - 150, height / 2 + 168);
  text("CREDITS", width / 2 - 132, height / 2 + 318);
}

void mousePressed() {
  if (mouseX >= buttonX && mouseX <= buttonX + buttonWidth) {
    if (mouseY >= buttonY && mouseY <= buttonY + buttonHeight) {
      
    }
  }
  
  
  
  
}
