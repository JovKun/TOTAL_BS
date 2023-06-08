class Archer extends Shooter {
  
  // Archer constructor 
  public Archer(int characterX, int characterY, TOTAL_BS gameObject, int player) {
    super("archer_projectile.v2.png", "archer_standing.v2.png", "archer_shooting.v2.png", "archer_running.v2.png", "archer_jumping.v2.png", "archer_dead.v2.png", characterX, characterY, gameObject, player, 15, -15, 0);
  }
}
