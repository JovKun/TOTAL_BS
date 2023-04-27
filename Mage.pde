class Mage extends Character {
  private PImage projectile;
  private int offset;
  
  public Mage(int characterX, int characterY) {
    super(5, 1, 1, "mage_standing.png", "mage_shooting.png", "mage_running.png", "mage_jumping.png", true, characterX, characterY);
    
    this.projectile = loadImage("mage_projectile.png");
    this.offset = 4;
  }
}
