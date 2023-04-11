int buttonWidth = 750;
int buttonHeight = 100;

PFont font;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
}

void draw() {
  background(200);
  
  fill(100);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight);
  
  fill(255);
  textFont(font);
  text("PLAY", width / 2 - 85, height / 2 + 18);
  text("SETTINGS", width / 2 - 150, height / 2 + 168);
  text("CREDITS", width / 2 - 132, height / 2 + 318);
}
