class Character {
  
  // Character variables
  protected int totalHealth, currentHealth;
  protected int attack, attackSpeed;
  
  protected PImage standing, attacking, running, jumping, dead;
  protected boolean isRange, isDead, boundLeft, boundRight;
  
  protected int characterX, characterY;
  protected float characterWidth, characterHeight;
  
  protected String state;
  
  protected float gravity;
  protected float velocityY, velocityX;
  
  // Character constructor
  public Character(int totalHealth, int attack, int attackSpeed, String standing, String attacking, String running, String jumping, String dead, boolean isRange, int characterX, int characterY) {
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
    
    this.characterWidth = height / 6;
    this.characterHeight = height / 6;
    
    this.state = "running";
    
    this.gravity = 1;
    this.velocityY = 0;
    this.velocityX = 0;
    
    this.boundLeft = false;
    this.boundRight = true;
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
    this.update();
    
    if (!this.isDead) {
      if (this.state == "standing") {
        image(standing, this.characterX, this.characterY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "jumping") {
        image(jumping, this.characterX, this.characterY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "running") {
        image(running, this.characterX, this.characterY, this.characterWidth, this.characterHeight); 
      } else if (this.state == "attacking") {
        image(attacking, this.characterX, this.characterY, this.characterWidth, this.characterHeight);
      }
    } else {
      image(dead, this.characterX, this.characterY, this.characterWidth, this.characterHeight);
    }
  }
  
  // Method to update the character
  protected void update() {
    if (this.characterY < height - 100) {
      this.velocityY += this.gravity;
      this.characterY += this.velocityY;
    } else {
      this.velocityY = 0;
      this.characterY = height - 100;
      this.state = "standing";
    }
    
    this.characterX += this.velocityX;
    
    if (this.characterX < 100) {
      this.boundLeft = true;
      
      this.velocityX = 0;
    } else if (this.characterX > width - 100) {
      this.boundRight = true;
      
      this.velocityX = 0;
    } else {
      this.boundLeft = false;
      this.boundRight = false;
    }
  }
  
  // Method to jump
  protected void jump() {
    if (this.characterY == height - 100) {
      this.state = "jumping";
      this.characterY = height - 101;
      this.velocityY = -27.5;
    }
  }
  
  // Method to move the character
  protected void move(char key_char) {
    if (key_char == 'a' && !this.boundLeft) {
      this.velocityX = -10;
    } else if (key_char == 'd' && !this.boundRight) {
      this.velocityX = 10; 
    }
  }
  
  // Method to stop moving the character
  protected void move () {
    this.velocityX = 0; 
  }
}
