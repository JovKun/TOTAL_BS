class Character {
  private int totalHealth, currentHealth;
  private int attack, attackSpeed;
  
  private PImage standing, attacking, running, jumping;
  private boolean isRange, isDead;
  
  private int characterX, characterY;
  
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
