import java.util.ArrayList;

class Shooter extends Character {
  
  // Shooter variables
  private String projectile;
  private ArrayList<Projectile> projectileArray;
  
  private int projectileOffset;
  
  private TOTAL_BS game;
  
  // Shooter constructor
  public Shooter(String projectileType, String standing, String attacking, String running, String jumping, String dead, int characterX, int characterY, TOTAL_BS gameObject, int player, int offsetX, int offsetY, int projectileOffset) {
    
    super(5, 1, 1, standing, attacking, running, jumping, dead, true, characterX, characterY, offsetX, offsetY, gameObject, player);
    
    this.projectile = projectileType;
    this.projectileArray = new ArrayList<Projectile>();
    
    this.projectileOffset = projectileOffset;
    
    this.game = gameObject;
    
    if (game.debug) {
      System.out.println("Debug is TRUE");
    } else {
      System.out.println("Debug is FALSE");
    }
  }
  
  // Method to shoot a projectile
  public void createProjectile() {
    this.projectileArray.add(new Projectile(this.projectile, this.projectileOffset, this.characterX, this.characterY, this.direction));
  }
  
  @Override public void update() {
    if (this.characterY < height - 100) {
      this.velocityY += this.gravity;
      this.characterY += this.velocityY;
    } else {
      this.velocityY = 0;
      this.characterY = height - 100;
    }
    
    // Check if the character has hit a boundary
    if (this.characterX < this.characterWidth * 0.2) {
      if (this.velocityX > 0) {
        this.characterX += this.velocityX; 
      }
    } else if (this.characterX > width - this.characterWidth * 0.2) {
      if (this.velocityX < 0) {
        this.characterX += this.velocityX;
      }
    } else {
      this.characterX += this.velocityX;
    }
    
    this.velocityX = 0;
    
    for (Projectile projectile : projectileArray) {
      projectile.display(); 
    }
  }
}
