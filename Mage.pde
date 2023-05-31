class Mage extends Character {
  
  // Mage variables
  private Projectile projectile;
  private int offset;
  private TOTAL_BS game;
  
  // Mage constructor
  public Mage(int characterX, int characterY, TOTAL_BS gameObject) {
    super(5, 1, 1, "mage_standing.v2.png", "mage_shooting.v2.png", "mage_running.v2.png", "mage_jumping.v2.png", "mage_dead.v2.png", true, characterX, characterY, 0, 0, gameObject);
    this.game = gameObject;
    this.projectile = new Projectile("mage_projectile.v2.png", 4);
    
    if (game.debug)
      System.out.println("Debug is TRUE");
    else
      System.out.println("Debug is FALSE");
  }
}
