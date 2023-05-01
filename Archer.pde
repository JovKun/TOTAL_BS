class Archer_1 extends Character {
  
  // Archer variables
  private Projectile projectile;
  
  // Archer constructor
  public Archer_1(int characterX, int characterY) {
    super(5, 2, 2, "archer_standing.v2.png", "archer_shooting.v2.png", "archer_running.v2.png", "archer_jumping.v2.png", "archer_dead.v2.png", true, characterX, characterY);
    
    this.projectile = new Projectile("archer_projectile.v2.png", 0);
  }
}
