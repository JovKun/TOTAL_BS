class InfernoPlatform {
  private int x;
  private int y;
  private int widthPlatform;
  private int heightPlatform;
  
  private PImage platform;
  private PImage ground;
  
  public InfernoPlatform(int x, int y) {
    this.x = x;
    this.y = y;
    this.widthPlatform = 180;
    this.heightPlatform = 30;
    
    this.platform = loadImage("inferno_platform.png");
    this.ground = loadImage("inferno_ground.png");
  }
  
  public void displayInferno() {
    imageMode(CENTER);
    image(this.platform, this.x, this.y);
  }

  public void displayInfernoBoundary() {
    image(this.ground, width / 2 - 780, height / 2 + 540);
    image(this.ground, width / 2 - 420, height / 2 + 540);
    image(this.ground, width / 2 - 60, height / 2 + 540);
    image(this.ground, width / 2 + 300, height / 2 + 540);
    image(this.ground, width / 2 + 660, height / 2 + 540);
    image(this.ground, width / 2 + 1020, height / 2 + 540);
    
  }
  
  
  
}
