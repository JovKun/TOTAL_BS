class Mage extends Character {
  private PImage projectile;
  private int offset;
  
  public Mage(int characterX, int characterY) {
    super(5, 1, 1, "mage_standing.v2.png", "mage_shooting.v2.png", "mage_running.v2.png", "mage_jumping.v2.png", true, characterX, characterY);
    
    this.projectile = loadImage("mage_projectile.v2.png");
    this.offset = 4;
  }
}
