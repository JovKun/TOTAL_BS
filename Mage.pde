class Mage extends Character {
  
  // Mage variables
  private Projectile projectile;
  private int offset;
  
  // Mage constructor
  public Mage(int characterX, int characterY) {
    super(5, 1, 1, "mage_standing.v2.png", "mage_shooting.v2.png", "mage_running.v2.png", "mage_jumping.v2.png", "mage_dead.v2.png", true, characterX, characterY);
    
    this.projectile = new Projectile("mage_projectile.v2.png", 4);
  }
}
