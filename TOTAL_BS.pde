PFont font;

PImage main_screen_art, play_scene_art, settings_scene_art, credits_scene_art;

Mage player_1;

Button buttonPlay, buttonSetting, buttonCredits, buttonInferno, buttonGlacier;

int scene = 0;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  main_screen_art = loadImage("main_screen_art.png");
  play_scene_art = loadImage("play_scene_art.png");
  settings_scene_art = loadImage("settings_scene_art.png");
  credits_scene_art = loadImage("credits_scene_art.png");
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
  
  buttonPlay = new Button(width / 2 - 350, height / 2, "PLAY", 1);
  buttonSetting = new Button(width / 2 - 350, height / 2 + 150, "SETTINGS", 2);
  buttonCredits = new Button(width / 2 - 350, height / 2 + 300, "CREDITS", 3);
  
  buttonInferno = new Button(width / 2 - 350, height / 2, "Inferno", 4);
  buttonGlacier = new Button(width / 2 - 350, height / 2 + 150, "Glacier", 5);
  buttonForest = new Button(width / 2 - 350, height / 2 + 300, "Forest", 6);
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
  } else if (scene == 1) {
    image(play_scene_art, width / 2, height / 2, width, height);
    
    buttonInferno.hoverChangeColor();
    buttonGlacier.hoverChangeColor();
    buttonForest.hoverChangeColor();
    
    fill(255);
    textFont(font);
  } else if (scene == 2) {
    image(settings_scene_art, width / 2, height / 2, width, height);
  } else if (scene == 3) {
    image(credits_scene_art, width / 2, height / 2, width, height);
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
