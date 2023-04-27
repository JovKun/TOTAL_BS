class Archer extends Character {
  private PImage projectile;
  
  public Archer(int characterX, int characterY) {
    super(5, 2, 2, "archer_standing.png", "archer_shooting.png", "archer_running.png", "archer_jumping.png", true, characterX, characterY);
    
    this.projectile = loadImage("archer_projectile.png");
  }
}
