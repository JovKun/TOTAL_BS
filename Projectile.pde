class Projectile {
  
  // Projectile variables
  private float projectileX, projectileY;
  private int projectileSize;
  
  private int speed;
  private int direction;
  
  private String team;
  
  // Projectile constructor
  public Projectile(float projectileX, float projectileY, String direction, String team) {
    this.projectileX = projectileX;
    this.projectileY = projectileY;
    this.projectileSize = 15;
    
    this.speed = 25;
    
    if (direction == "left") {
      this.direction = -1; 
    } else if (direction == "right") {
      this.direction = 1; 
    }
    
    this.team = team;
  }
  
  // Method to display the projectile
  public void display() {
    
    // Give the projectiles the team colours
    if (this.team == "red") {
      fill(255, 50, 50); 
    } else if (this.team == "blue") {
      fill(50, 50, 255); 
    }
    
    // Draw the projectile
    ellipse(this.projectileX, this.projectileY, this.projectileSize, this.projectileSize);
    
    // Update the projectile
    this.update();
  }
  
  // Method to update the projectile
  private void update() {
    this.projectileX += this.direction * this.speed;
  }
  
  // Method to get the X coordinate of the centre of the projectile
  public float getX() {
    return this.projectileX;
  }
  
  // Method to get the Y coordinate of the centre of the projectile
  public float getY() {
    return this.projectileY;
  }
}
