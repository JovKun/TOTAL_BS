class Projectile {
  
  // Projectile variables
  private PImage projectile;
  
  private int projectileX, projectileY;
  private int speedX = 20;
  private int direction;
  
  private int offset;
  
  // Projectile constructor
  public Projectile(String projectile, int offset, int projectileX, int projectileY, String direction) {
    this.projectile = loadImage(projectile);
    this.offset = offset;
    
    this.projectileX = projectileX;
    this.projectileY = projectileY;
    
    if (direction == "right") {
      this.direction = 1; 
    } else if (direction == "left") {
      this.direction = -1; 
    }
  }
  
  // Method to display the projectile
  public void display() {
    this.update();
    
    image(this.projectile, this.projectileX + this.offset, this.projectileY);
  }
  
  // Method to update the projectile
  private void update() {
    this.projectileX += speedX * direction;
  }
}
