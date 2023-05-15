PFont font;

PImage main_screen_art, play_scene_art, settings_scene_art, credits_scene_art;

Mage player_1;

Button buttonPlay, buttonSetting, buttonCredits, buttonInferno, buttonGlacier, buttonForest;

int scene = 0;

void setup() {
  fullScreen();
  
  font = createFont("font.ttf", 64);
  
  imageMode(CENTER);
  
  player_1 = new Mage(200, 200);
  
  buttonPlay = new Button(width / 2 - 350, height / 2, "PLAY", 1);
  buttonSetting = new Button(width / 2 - 350, height / 2 + 150, "SETTINGS", 2);
  buttonCredits = new Button(width / 2 - 350, height / 2 + 300, "CREDITS", 3);
  
  buttonInferno = new Button(width / 2 - 350, height / 2, "Inferno", 4);
  buttonGlacier = new Button(width / 2 - 350, height / 2 + 150, "Glacier", 5);
  buttonForest = new Button(width / 2 - 350, height / 2 + 300, "Forest", 6);
  
  textFont(font);
}

void draw() {
  if (scene == 0) {
    background(100);
    
    fill(0);
    buttonPlay.hoverChangeColor();
    buttonSetting.hoverChangeColor();
    buttonCredits.hoverChangeColor();
    
    fill(255);
  } else if (scene == 1) {
    background(100);
    
    buttonInferno.hoverChangeColor();
    buttonGlacier.hoverChangeColor();
    buttonForest.hoverChangeColor();
    
    fill(255);
	player_1.display();
  } else if (scene == 2) {
    background(100);
  } else if (scene == 3) {
    background(100);
  } else if (scene == 4) {
    background(255, 0, 0);
  } else if (scene == 5) {
    background(0, 0, 255);
  } else if (scene == 6) {
    background(0, 255, 0);
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
  } else if (scene == 1) {
    if (buttonInferno.isMouseClicked(scene) != scene) {
      scene = buttonInferno.isMouseClicked(scene);
    } else if (buttonGlacier.isMouseClicked(scene) != scene){
      scene = buttonGlacier.isMouseClicked(scene);
    } else if (buttonForest.isMouseClicked(scene) != scene) {
      scene = buttonForest.isMouseClicked(scene);
    }
  }
}

void keyPressed() {
  if (key == 'w') {
    player_1.jump(); 
  } else if (key == 'a' || key == 'd') {
    player_1.move(key);
  }
}

void keyReleased() {
  if (key == 'a' || key == 'd') {
    player_1.move(); 
  }
}
