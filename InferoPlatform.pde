class InfernoPlatform {
  private int x;
  private int y;
  private int widthPlatform;
  private int heightPlatform;
  
  private PImage platform;
  
  public InfernoPlatform(int x, int y) {
    this.x = x;
    this.y = y;
    this.widthPlatform = 200;
    this.heightPlatform = 40;
    
    this.platform = loadImage("inferno_platform.png");
  }
  
  public void displayInferno() {
    imageMode(CENTER);
    image(this.platform, this.x, this.y);
  }
  
  
  
  
}
