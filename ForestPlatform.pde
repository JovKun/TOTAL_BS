class ForestPlatform {
  private int x;
  private int y;
  private int widthPlatform;
  private int heightPlatform;
  
  private PImage platform;
  
  public ForestPlatform(int x, int y) {
    this.x = x;
    this.y = y;
    this.widthPlatform = 180;
    this.heightPlatform = 30;
    
    this.platform = loadImage("forest_platform.png");
  }
  
  public void displayForest() {
    imageMode(CENTER);
    image(this.platform, this.x, this.y);
  }
  
  
}
