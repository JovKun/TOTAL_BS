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
    this.projectileSize = 10;
    
    this.speed = 25;
    
    if (direction == "left") {
      this.direction = -1; 
    } else if (direction == "right") {
      this.direction = 1; 
    }
    
    this.team = team;
  }
  
  public void display() {
    if (this.team == "red") {
      fill(255, 50, 50); 
    } else if (this.team == "blue") {
      fill(50, 50, 255); 
    }
    
    ellipse(this.projectileX, this.projectileY, this.projectileSize, this.projectileSize);
    
    this.update();
  }
  
  private void update() {
    this.projectileX += this.direction * this.speed;
  }
}
