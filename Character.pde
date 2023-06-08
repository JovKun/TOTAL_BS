class Character {
  
  // Character variables
  protected int totalHealth, currentHealth;
  protected int attack, attackSpeed;
  
  protected PImage standing, attacking, running, jumping, dead;
  protected boolean isRange, isDead, boundLeft, boundRight;
  
  protected int characterX, characterY;
  protected int offsetX, offsetY;
  protected float characterWidth, characterHeight;
  
  protected String state;
  
  protected float gravity;
  protected float velocityY, velocityX;
  
  protected String direction;
  
  protected int flip;
  private TOTAL_BS game;
  
  protected int bottomLeft;
  protected int bottomRight;
  protected int topLeft;
  protected int topRight;
  
  
  
  // Character constructor
  public Character(int totalHealth, int attack, int attackSpeed, String standing, String attacking, String running, String jumping, String dead, boolean isRange, int characterX, int characterY, int offsetX, int offsetY, TOTAL_BS game, int player) {
    this.game = game;
    this.totalHealth = totalHealth;
    this.currentHealth = totalHealth;
    this.attack = attack;
    this.attackSpeed = attackSpeed;
    
    this.standing = loadImage(standing);
    this.attacking = loadImage(attacking);
    this.running = loadImage(running);
    this.jumping = loadImage(jumping);
    this.dead = loadImage(dead);
    this.dead.filter(GRAY);
    
    this.isRange = isRange;
    this.isDead = false;
    
    this.characterX = characterX;
    this.characterY = characterY;
    
    this.offsetX = offsetX;
    this.offsetY = offsetY;
    
    this.characterWidth = height / 6;
    this.characterHeight = height / 6;
    
    this.state = "standing";
    
    this.gravity = 2;
    this.velocityY = 0;
    this.velocityX = 0;
    
    this.boundLeft = false;
    this.boundRight = true;
    
    if (player == 0) {
      this.direction = "right"; 
    } else if (player == 1) {
      this.direction = "left";
    }
    
    this.flip = 1;
  }
  
  // Method to take damage
  protected void takeDamage(int amount) {
    if (amount >= this.currentHealth) {
      this.currentHealth = 0;
      this.isDead = true;
    } else {
      this.currentHealth -= amount; 
    }
  }
  
  // Method to display the character
  protected void display() {
    pushMatrix();
    
    if (this.velocityY != 0) {
      this.state = "jumping";
      
      if (this.direction == "right") {
        this.flip = 1;
      } else if (this.direction == "left") {
        this.flip = -1;
      }
    } else {
      if (this.velocityX > 0) {
        this.flip = 1;
        this.state = "running";
      } else if (this.velocityX < 0) {
        this.flip = -1;
        this.state = "running";
      } else {
        if (this.direction == "right") {
          this.flip = 1;
        } else if (this.direction == "left") {
          this.flip = -1; 
        }
        
        this.state = "standing"; 
      }
    }
    
    scale(this.flip, 1);
    
    this.update();
    
    if (!this.isDead) {
      if (this.state == "standing") {
        image(standing, this.flip * this.characterX + this.offsetX, this.characterY + this.offsetY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "jumping") {
        image(jumping, this.flip * this.characterX + this.offsetX, this.characterY + this.offsetY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "running") {
        image(running, this.flip * this.characterX + this.offsetX, this.characterY + this.offsetY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "attacking") {
        image(attacking, this.flip * this.characterX + this.offsetX, this.characterY + this.offsetY, this.characterWidth, this.characterHeight);
      }
    } else {
      image(dead, this.characterX, this.characterY, this.characterWidth, this.characterHeight);
    }
    
    popMatrix();
    
    if (!this.isDead) {
      if (game.debug) {
        if (this.direction == "right") {
          if (Mage.class.isInstance(game.player1) || Mage.class.isInstance(game.player2)) {
            translate(-5, 0);
            rect(this.characterX + this.offsetX - this.characterWidth * 0.16, this.characterY + this.offsetY - this.characterHeight * 0.2 - 1, this.characterWidth / 2.70, this.characterHeight / 2.40, 1);
          } 
          else if (Knight.class.isInstance(game.player1) || Knight.class.isInstance(game.player2)) {
             translate(10, 5);
             rect(this.characterX + this.offsetX - this.characterWidth * 0.16, this.characterY + this.offsetY - this.characterHeight * 0.2 - 1, this.characterWidth / 2.70, this.characterHeight / 2.40, 1);
          } 
          else {
            translate(-20, 0);
            rect(this.characterX + this.offsetX - this.characterWidth * 0.16, this.characterY + this.offsetY - this.characterHeight * 0.2 - 1, this.characterWidth / 2.70, this.characterHeight / 2.40, 1);

          }
          noFill();
          stroke(400, 100, 0);
          
        }
        if (this.direction == "left") {
          if (Mage.class.isInstance(game.player1) || Mage.class.isInstance(game.player2)) {
            translate(-25, -5);
            rect(this.characterX + this.offsetX - this.characterWidth * 0.16, this.characterY + this.offsetY - this.characterHeight * 0.2 - 1, this.characterWidth / 2.70, this.characterHeight / 2.40, 1);
          }
          else {
            translate(-20, 0);
            rect(this.characterX + this.offsetX - this.characterWidth * 0.16, this.characterY + this.offsetY - this.characterHeight * 0.2 - 1, this.characterWidth / 2.70, this.characterHeight / 2.40, 1);
          }
          noFill();
          stroke(400, 100, 0);
        }
      }
    } 
  }
  
  protected float getY(float yy) {
      yy = this.characterY + this.offsetY - this.characterHeight * 0.2 - 1;
      return yy;
  }
 
  protected float getX(float xx) {
      xx = this.characterX + this.offsetX - this.characterWidth * 0.16;
      return xx;
  }
  
  // Method to update the character
  protected void update() {
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
    
    if (game.scene == 5) {
      for (GlacierPlatform platform : glacierLevel) {
        if (this.topRight.getY() < platform.topLeft.getY() || this.bottomLeft.getY() > platform.bottomRight.getY()) {
          this.velocityY = 0;
       }
        if (this.topRight.getX() < platform.topLeft.getX() || this.bottomLeft.getX() > platform.bottomRight.getX()) {
          this.velocityX = 0;
       }
      }
    }
  }
  
  // Method to jump
  protected void jump() {
    if (this.characterY == height - 100) {
      this.characterY = height - 101;
      this.velocityY = -37.5;
    }
  }
  
  // Method to move the character
  protected void move(String direction) {
    if (direction == "left") {
      this.velocityX -= 10;
    } else if (direction == "right") {
      this.velocityX += 10;
    }
    
    this.direction = direction;
  }
}
