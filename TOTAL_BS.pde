PFont font;

PImage main_screen_art;

Mage player_1;

Button buttonPlay, buttonSetting, buttonCredits;

int scene = 0;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  main_screen_art = loadImage("main_screen_art.png");
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
  
  buttonPlay = new Button(width / 2 - 350, height / 2, "PLAY", 1);
  buttonSetting = new Button(width / 2 - 350, height / 2 + 150, "SETTINGS", 2);
  buttonCredits = new Button(width / 2 - 350, height / 2 + 300, "CREDITS", 3);
}

void draw() {
  if (scene == 0) {
    image(main_screen_art, width / 2, height / 2, width, height);
    
    fill(0);
    buttonPlay.hoverChangeColor();
    buttonSetting.hoverChangeColor();
    buttonCredits.hoverChangeColor();
    
    fill(255);
    textFont(font);
    
    player_1.display();
  } else {
    background(255);  
  }
}

void mouseClicked() {
  if (scene == 0) {
    if (buttonPlay.isMouseClicked(scene) != scene) {
      scene = buttonPlay.isMouseClicked(scene);
    } else if (buttonSetting.isMouseClicked(scene) != scene){
      scene = buttonSetting.isMouseClicked(scene);
    } else if (buttonCredits.isMouseClicked(scene) != scene) {
      scene = buttonCredits.isMouseClicked(scene);
    }
  }
}
