class InfernoPlatform {
  private int x;
  private int y;
  private int widthPlatform;
  private int heightPlatform;
  
  private int hitboxX, hitboxY;
  
  private PImage platform;
  private PImage ground;
  
  public InfernoPlatform(int x, int y) {
    this.x = x;
    this.y = y;
    this.widthPlatform = 360;
    this.heightPlatform = 60;
    
    this.hitboxX = this.x - 180;
    this.hitboxY = this.y - 80;
    
    this.platform = loadImage("inferno_platform.png");
    this.ground = loadImage("inferno_ground.png");
  }
  
  public void display() {
    imageMode(CENTER);
    image(this.platform, this.x, this.y);
    rect(this.hitboxX, this.hitboxY, this.widthPlatform, this.heightPlatform);
  }

  public void displayBoundary() {
    image(this.ground, width / 2 - 780, height / 2 + 540);
    image(this.ground, width / 2 - 420, height / 2 + 540);
    image(this.ground, width / 2 - 60, height / 2 + 540);
    image(this.ground, width / 2 + 300, height / 2 + 540);
    image(this.ground, width / 2 + 660, height / 2 + 540);
    image(this.ground, width / 2 + 1020, height / 2 + 540);
    
  }
}
