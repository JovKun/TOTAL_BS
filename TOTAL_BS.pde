int buttonWidth = 750;
int buttonHeight = 100;

void setup() {
  fullScreen(); 
}

void draw() {
  background(200);
  
  fill(100);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight);
  
  fill(255);
  textSize(50);
  text("This is a button", width / 2 - 200, height / 2 - 10);
}
