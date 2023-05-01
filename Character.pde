class Character {
  
  // Character variables
  protected int totalHealth, currentHealth;
  protected int attack, attackSpeed;
  
  protected PImage standing, attacking, running, jumping, dead;
  protected boolean isRange, isDead;
  
  protected int characterX, characterY;
  protected float characterWidth, characterHeight;
  
  protected String state;
  
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
    
    this.isRange = isRange;
    this.isDead = false;
    
    this.characterX = characterX;
    this.characterY = characterY;
    
    this.characterWidth = height / 6;
    this.characterHeight = height / 6;
    
    this.state = "running";
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
}
