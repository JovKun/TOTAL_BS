// Import necessary modules
import java.util.ArrayList;

class Character {
  
  // Character variables
  private int health;
  private boolean isDead;
  
  private int characterX, characterY;
  private int startCharacterX, startCharacterY;
  private int characterWidth, characterHeight;
  
  private float gravity;
  private float velocityY;
  
  private String direction;
  private String startDirection;
  
  private String team;
  
  private int groundHeight;
  private int movementSpeed;
  private int jumpSpeed;
  
  private boolean inAir;
  
  private ArrayList<Projectile> projectileArray;
  private ArrayList<Platform> platformArray;
  
  // Character constructor
  public Character(int characterX, int characterY, String direction, String team, ArrayList<Platform> platformArray) {
    this.health = 5;
    this.isDead = false;
    
    this.characterX = characterX;
    this.characterY = characterY;
    this.startCharacterX = characterX;
    this.startCharacterY = characterY;
    this.characterWidth = 50;
    this.characterHeight = 80;
    
    this.gravity = 1.5;
    this.velocityY = 0;
    
    this.direction = direction;
    this.startDirection = direction;
    
    this.team = team;
    
    this.groundHeight = 50;
    this.movementSpeed = 15;
    this.jumpSpeed = -30;
    
    this.inAir = true;
    
    this.projectileArray = new ArrayList<Projectile>();
    this.platformArray = platformArray;
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
    
    // Check if the opponent is still alive
    if (!this.ifDead() && !otherPlayer.ifDead()) {
      
      // Loop through all the projectiles and update them
      for (int projectileIndex = 0; projectileIndex < this.projectileArray.size(); projectileIndex++) {
        
        Projectile currentProjectile = this.projectileArray.get(projectileIndex);
        
        // Check if any projectiles has hit the other player
        if (currentProjectile.getX() - 7.5 > otherPlayer.getX() && currentProjectile.getX() + 7.5 < otherPlayer.getX() + this.characterWidth &&
            currentProjectile.getY() - 7.5 > otherPlayer.getY() && currentProjectile.getY() + 7.5 < otherPlayer.getY() + this.characterHeight) {
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
        
        // Boolean to store whether this projectile has hit any platform
        boolean hitPlatform = false;
        
        // Loop through all platforms until it finds that it has hit one, or if it missed all of them
        for (int platformIndex = 0; platformIndex < this.platformArray.size(); platformIndex++) {
          
          Platform currentPlatform = this.platformArray.get(platformIndex);
          
          if (currentProjectile.getX() - 7.5 > currentPlatform.getX() && currentProjectile.getX() + 7.5 < currentPlatform.getX() + currentPlatform.getWidth() &&
              currentProjectile.getY() - 7.5 > currentPlatform.getY() && currentProjectile.getY() + 7.5 < currentPlatform.getY() + 50) {
            this.projectileArray.remove(projectileIndex);
            
            projectileIndex--;
            
            hitPlatform = true;
            
            break;
          }
        }
        
        // Skip the display function if it has hit any platforms
        if (hitPlatform) {
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
    if (this.characterY + this.velocityY + this.characterHeight > height - this.groundHeight) {
      this.characterY = height - this.groundHeight - this.characterHeight;
      this.velocityY = 0;
      
      this.inAir = false;
    } else if (this.characterY + this.velocityY < 0) {
      this.characterY = 0;
      this.velocityY = 0;
    } else {
        
      // Loop through all the platforms since the character is not on the ground
      for (int platformIndex = 0; platformIndex < this.platformArray.size(); platformIndex++) {
          
        Platform currentPlatform = this.platformArray.get(platformIndex);
          
        // Check if it hits the platform
        if (this.characterX + this.characterWidth > currentPlatform.getX() && this.characterX < currentPlatform.getX() + currentPlatform.getWidth() &&
            this.characterY + this.characterHeight + this.velocityY > currentPlatform.getY() && this.characterY + this.velocityY < currentPlatform.getY() + 50) {
            
          // Check if the character hit the platform from the side
          if (this.characterX + this.characterWidth < currentPlatform.getX() + 16) {
            this.characterX = currentPlatform.getX() - this.characterWidth;
          } else if (this.characterX > currentPlatform.getX() + currentPlatform.getWidth() - 16) {
            this.characterX = currentPlatform.getX() + currentPlatform.getWidth();
          } else {
              
            // The character just jumped, so it must have hit the bottom
            if (this.velocityY < 0) {
              this.characterY = currentPlatform.getY() + 50;
              this.velocityY = 0;
              
              break;
            }
            
            // The character is falling, so it must have hit the top
            if (this.velocityY > 0) {
              this.characterY = currentPlatform.getY() - this.characterHeight;
              this.velocityY = 0;
              
              this.inAir = false;
              
              break;
            } 
          }
        } 
      }
    }
    
    this.characterY += this.velocityY;
  }
  
  // Method to make the characters jump
  public void jump() {
    if (!this.inAir) {
      this.velocityY = this.jumpSpeed;
      this.characterY += velocityY;
      
      this.inAir = true;
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
  
  // Method to return whether the character is dead or not
  public boolean ifDead() {
    return this.isDead; 
  }
  
  // Method to set the X coordinate of the top-left of the character
  public void setX(int characterX) {
    this.characterX = characterX; 
  }
  
  // Method to set the Y coordinate of the top-left of the character
  public void setY (int characterY) {
    this.characterY = characterY; 
  }
  
  // Method to reset the game
  public void reset() {
    this.isDead = false;
    this.health = 5;
    
    this.characterX = this.startCharacterX;
    this.characterY = this.startCharacterY;
    
    this.direction = this.startDirection;
    
    this.velocityY = 0;
    
    this.projectileArray.clear();
  }
}
