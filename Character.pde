class Character {
  protected int totalHealth, currentHealth;
  protected int attack, attackSpeed;
  
  protected PImage standing, attacking, running, jumping;
  protected boolean isRange, isDead;
  
  protected int characterX, characterY;
  protected float characterWidth, characterHeight;
  
  protected String state;
  
  public Character(int totalHealth, int attack, int attackSpeed, String standing, String attacking, String running, String jumping, boolean isRange, int characterX, int characterY) {
    this.totalHealth = totalHealth;
    this.currentHealth = totalHealth;
    this.attack = attack;
    this.attackSpeed = attackSpeed;
    
    this.standing = loadImage(standing);
    this.attacking = loadImage(attacking);
    this.running = loadImage(running);
    this.jumping = loadImage(jumping);
    
    this.isRange = isRange;
    this.isDead = false;
    
    this.characterX = characterX;
    this.characterY = characterY;
    
    this.characterWidth = height / 6;
    this.characterHeight = height / 6;
    
    this.state = "standing";
  }
  
  public void takeDamage(int amount) {
    if (amount >= this.currentHealth) {
      this.currentHealth = 0;
      this.isDead = true;
    } else {
      this.currentHealth -= amount; 
    }
  }
}
