class Platform {
  
  // Platform variables
  private int platformX, platformY;
  private int platformWidth, platformHeight;
  
  // Platform constructor
  public Platform(int platformX, int platformY, int platformWidth) {
    this.platformX = platformX;
    this.platformY = platformY;
    this.platformWidth = platformWidth;
    this.platformHeight = 50;
  }
  
  // Method to display each platform
  public void display() {
    fill(100);
    
    rect(platformX, platformY, platformWidth, platformHeight);
  }
  
  // Method to get the X coordinate of the top-left of the platform
  public int getX() {
    return this.platformX; 
  }
  
  // Method to get the Y coordinate of the top-left of the platform
  public int getY() {
    return this.platformY;
  }
  
  // Method to get the width of the platform
  public int getWidth() {
    return this.platformWidth; 
  }
}
