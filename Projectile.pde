class Projectile {
  
  // Projectile variables
  private PImage projectile;
  
  private int projectileX, projectileY;
  private int speedX = 30;
  private int direction;
  
  private int offset;
  
  // Projectile constructor
  public Projectile(String projectile, int offset, int projectileX, int projectileY, String direction) {
    this.projectile = loadImage(projectile);
    this.offset = offset;
    
    this.projectileX = projectileX - 175;
    this.projectileY = projectileY - 15;
    
    if (direction == "right") {
      this.direction = 1; 
    } else if (direction == "left") {
      this.direction = -1; 
    }
  }
  
  // Method to display the projectile
  public void display() {
    pushMatrix();
    
    this.update();
    scale(this.direction, 1);
    image(this.projectile, this.direction * this.projectileX + this.offset, this.projectileY);
    
    popMatrix();
  }
  
  // Method to update the projectile
  private void update() {
    this.projectileX += speedX * direction;
  }
}
