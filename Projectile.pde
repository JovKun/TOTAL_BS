class Projectile {
  
  // Projectile variables
  private PImage projectile;
  private int offset;
  
  // Projectile constructor
  public Projectile(String projectile, int offset) {
    this.projectile = loadImage(projectile);
    this.offset = offset;
  }
}
