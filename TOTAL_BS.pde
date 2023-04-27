int buttonWidth = 750;
int buttonHeight = 100;

PFont font;

PImage main_screen_art;

Mage player_1;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  main_screen_art = loadImage("main_screen_art.png");
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
}

void draw() {
  image(main_screen_art, width / 2, height / 2, width, height);
  
  fill(0);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight, 50, 50, 50, 50);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight, 50, 50, 50, 50);
  rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight, 50, 50, 50, 50);
  
  fill(255);
  textFont(font);
  text("PLAY", width / 2 - 85, height / 2 + 18);
  text("SETTINGS", width / 2 - 150, height / 2 + 168);
  text("CREDITS", width / 2 - 132, height / 2 + 318);
  
  player_1.display();
}
