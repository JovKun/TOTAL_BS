int buttonWidth = 750;
int buttonHeight = 100;

PFont font;

PImage main_screen_art;

Mage player_1;

int lockedWidth, playHeight, settingHeight, creditsHeight;

Button buttonPlay, buttonSetting, buttonCredits;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  main_screen_art = loadImage("main_screen_art.png");
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
  
  lockedWidth = width / 2 - buttonWidth / 2;
  playHeight = height / 2 - buttonHeight / 2;
  settingHeight = height / 2 - buttonHeight / 2 + 150;
  creditsHeight = height / 2 - buttonHeight / 2 + 300;
  
  buttonPlay = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2, buttonWidth, buttonHeight, "PLAY");
  buttonSetting = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 150, buttonWidth, buttonHeight, "SETTINGS");
  buttonCredits = new Button(width / 2 - buttonWidth / 2, height / 2 - buttonHeight / 2 + 300, buttonWidth, buttonHeight, "CREDITS");
}

void draw() {
  image(main_screen_art, width / 2, height / 2, width, height);
  
  fill(0);
  buttonPlay.display();
  buttonPlay.displayText();
  buttonSetting.display();
  buttonSetting.displayText();
  buttonCredits.display();
  buttonCredits.displayText();
  
  if (mouseX >= lockedWidth && mouseX <= lockedWidth + buttonWidth && mouseY >= playHeight && mouseY <= playHeight + buttonHeight) {
    buttonPlay.hoverChangeColor();
  } else if (mouseX >= lockedWidth && mouseX <= lockedWidth + buttonWidth && mouseY >= settingHeight && mouseY <= settingHeight + buttonHeight){
    buttonSetting.hoverChangeColor();
  } else if (mouseX >= lockedWidth && mouseX <= lockedWidth + buttonWidth && mouseY >= creditsHeight && mouseY <= creditsHeight + buttonHeight) {
    buttonCredits.hoverChangeColor();
  } else {
  }
  
  fill(255);
  textFont(font);
  
  player_1.display();
}
