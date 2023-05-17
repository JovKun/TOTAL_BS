class GlacierPlatform {
  private int x;
  private int y;
  private int widthPlatform;
  private int heightPlatform;
  
  private PImage platform;
  
  public GlacierPlatform(int x, int y) {
    this.x = x;
    this.y = y;
    this.widthPlatform = 200;
    this.heightPlatform = 40;
    
    this.platform = loadImage("glacier_platform.png");
  }
  
  public void displayGlacier() {
    imageMode(CENTER);
    image(this.platform, this.x, this.y);
  }
  
  
}