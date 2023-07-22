import java.util.ArrayList;

class Character {
  
  // Character variables
  private int health;
  private boolean isDead;
  
  private int characterX, characterY;
  private int characterWidth, characterHeight;
  
  private float gravity;
  private float velocityY;
  
  private String direction;
  
  private String team;
  
  private int groundHeight;
  private int movementSpeed;
  private int jumpSpeed;
  
  private ArrayList<Projectile> projectileArray;
  
  // Character constructor
  public Character(int characterX, int characterY, String direction, String team) {
    this.health = 5;
    this.isDead = false;
    
    this.characterX = characterX;
    this.characterY = characterY;
    this.characterWidth = 50;
    this.characterHeight = 80;
    
    this.gravity = 1.5;
    this.velocityY = 0;
    
    this.direction = direction;
    
    this.team = team;
    
    this.groundHeight = 50;
    this.movementSpeed = 15;
    this.jumpSpeed = -30;
    
    this.projectileArray = new ArrayList<Projectile>();
  }
  
  // Method to display the characters
  public void display(Character otherPlayer) {
    noStroke();
    
    // Give the players the team colours
    if (this.team == "blue") {
      fill(50, 50, 255); 
    } else if (this.team == "red") {
      fill(255, 50, 50); 
    }
    
    // Draw the player
    rect(this.characterX, this.characterY, this.characterWidth, this.characterHeight);
    
    if (this.health <= 0) {
      this.isDead = true; 
    }
    
    // Display the health bar
    if (this.team == "red") {
      fill(255, 50, 50);
      
      for (int currentHealth = 0; currentHealth < this.health; currentHealth++) {
        rect(25, currentHealth * 40 + 25, 25, 25);
      }
    } else if (this.team == "blue") {
      fill(50, 50, 255);
      
      for (int currentHealth = 0; currentHealth < this.health; currentHealth++) {
        rect(width - 50, currentHealth * 40 + 25, 25, 25);
      }
    }
    
    if ((!this.isDead && !otherPlayer.ifDead()) || (this.isDead && !otherPlayer.ifDead())) {
      
      // Update the projectiles
      for (int projectileIndex = 0; projectileIndex < this.projectileArray.size(); projectileIndex++) {
        
        Projectile currentProjectile = this.projectileArray.get(projectileIndex);
        
        // Check if any projectiles has hit the other player
        if (currentProjectile.getX() - 7.5 > otherPlayer.getX() && currentProjectile.getX() + 7.5 < otherPlayer.getX() + this.characterWidth &&
            currentProjectile.getY() - 7.5 > otherPlayer.getY() && currentProjectile.getY() + 7/5 < otherPlayer.getY() + this.characterHeight) {
          otherPlayer.takeDamage();
          
          this.projectileArray.remove(projectileIndex);
          
          projectileIndex--;
          
          continue;
        }
        
        // Check if any projectiles has shot out of the screen
        if (currentProjectile.getX() < 0 || currentProjectile.getX() > width) {
          this.projectileArray.remove(projectileIndex);
          
          projectileIndex--;
          
          continue;
        }
        
        // Display each and every projectile
        this.projectileArray.get(projectileIndex).display();
      }
      
      // Update the characters themselves
      this.update();  
    }
  }
  
  // Method to update the characters
  private void update() {
    
    // Update the y value
    this.velocityY += this.gravity; 
    
    // Only update characterY if character is above the ground, if not, set velocityY to 0
    if (this.characterY + this.velocityY + this.characterHeight > height - 50) {
      this.characterY = height - this.groundHeight - this.characterHeight;
      this.velocityY = 0;
    }
    
    this.characterY += this.velocityY;
  }
  
  // Method to make the characters jump
  public void jump() {
    if (this.characterY + this.characterHeight == height - 50) {
      this.velocityY = this.jumpSpeed;
      this.characterY += velocityY;
    }
  }
  
  // Method to make the characters move in either direction
  public void move(String direction) {
    
    // Check if the character has hit the left boundary
    if (direction == "left") {
      if (this.characterX > 0) {
        this.characterX -= this.movementSpeed;
      } else {
        this.characterX = 0; 
      }
    } else if (direction == "right") {
      
      // Check if the character has hit the right boundary
      if (this.characterX < width - this.characterWidth) {
        this.characterX += this.movementSpeed; 
      } else {
        this.characterX = width - this.characterWidth;
      }
    }
    
    // Whatever the keypress is the new direction
    this.direction = direction;
  }
  
  // Method to shoot a projectile
  public void shoot() {
    projectileArray.add(new Projectile(this.characterX + this.characterWidth / 2, this.characterY + this.characterHeight / 3, this.direction, this.team));
  }
  
  // Method to take damage
  public void takeDamage() {
    this.health--;
  }
  
  // Method to get the X coordinate of the top-left of the character
  public int getX() {
    return this.characterX;
  }
  
  // Method to get the Y coordiante of the top-left of the character
  public int getY() {
    return this.characterY; 
  }
  
  public boolean ifDead() {
    return this.isDead; 
  }
  
  public void setVelocityY(int velocityY) {
    this.velocityY = velocityY; 
  }
  
  public void setGroundHeight(int groundHeight) {
    this.groundHeight = groundHeight; 
  }
}
