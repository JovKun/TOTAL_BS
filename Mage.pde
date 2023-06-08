class Mage extends Shooter {
  
  // Mage constructor
  public Mage(int characterX, int characterY, TOTAL_BS gameObject, int player) {
    super("mage_projectile.v2.png", "mage_standing.v2.png", "mage_shooting.v2.png", "mage_running.v2.png", "mage_jumping.v2.png", "mage_dead.v2.png", characterX, characterY, gameObject, player, 0, 0, 4);
  }
}
