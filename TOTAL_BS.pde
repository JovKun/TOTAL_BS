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
  int lockedWidth = width / 2 - buttonWidth / 2;
  int playHeight = height / 2 - buttonHeight / 2;
  int settingHeight = height / 2 - buttonHeight / 2 + 150;
  int creditsHeight = height / 2 - buttonHeight / 2 + 300;
  image(main_screen_art, width / 2, height / 2, width, height);
  
  fill(0);
  Button buttonPlay = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight, "PLAY");
  buttonPlay.display();
  buttonPlay.displayText();
  
  Button buttonSetting = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight, "SETTINGS");
  buttonSetting.display();
  buttonSetting.displayText();
  
  Button buttonCredits = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight, "CREDITS");
  buttonCredits.display();
  buttonCredits.displayText();
  
  //rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight, 50, 50, 50, 50);
  //rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight, 50, 50, 50, 50);
  //rect(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight, 50, 50, 50, 50);
  
  //fill(255);
  //textFont(font);
  //text("PLAY", width / 2 - 85, height / 2 + 18);
  //text("SETTINGS", width / 2 - 150, height / 2 + 168);
  //text("CREDITS", width / 2 - 132, height / 2 + 318);
  
  player_1.display();
}
