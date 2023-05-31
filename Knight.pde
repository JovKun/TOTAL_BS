class Knight extends Character {
  
  // Knight constructor
  public Knight(int characterX, int characterY, TOTAL_BS gameObject) {
    super(10, 3, 3, "knight_standing.v2.png", "knight_attacking.v2.png", "knight_running.v2.png", "knight_jumping.v2.png", "knight_dead.v2.png", false, characterX, characterY, 0, -24, gameObject);
    
  }
}
