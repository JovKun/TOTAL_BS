PFont font;

PImage main_screen_art;

Mage player_1;

Button buttonPlay, buttonSetting, buttonCredits;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  main_screen_art = loadImage("main_screen_art.png");
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
  
  buttonPlay = new Button(width / 2 - 350, height / 2, "PLAY");
  buttonSetting = new Button(width / 2 - 350, height / 2 + 150, "SETTINGS");
  buttonCredits = new Button(width / 2 - 350, height / 2 + 300, "CREDITS");
}

void draw() {
  image(main_screen_art, width / 2, height / 2, width, height);
  
  fill(0);
  buttonPlay.hoverChangeColor();
  buttonSetting.hoverChangeColor();
  buttonCredits.hoverChangeColor();
  
  fill(255);
  textFont(font);
  
  player_1.display();
}
