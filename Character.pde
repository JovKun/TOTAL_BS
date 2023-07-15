class Character {
  
  // Character variables
  private int health;
  private int attack;
  
  private int characterX, characterY;
  private int characterWidth, characterHeight;
  
  private float gravity;
  private float velocityY;
  
  private String direction;
  
  private String team;
  
  private int groundHeight;
  private int movementSpeed;
  private int jumpSpeed;
  
  // Character constructor
  public Character(int characterX, int characterY, String direction, String team) {
    this.health = 5;
    this.attack = 1;
    
    this.characterX = characterX;
    this.characterY = characterY;
    
    this.characterWidth = 50;
    this.characterHeight = 80;
    
    this.gravity = 1.5;
    this.velocityY = 0;
    
    this.direction = direction;
    
    this.team = team;
    
    this.groundHeight = 50;
    this.movementSpeed = 15;
    this.jumpSpeed = -30;
  }
  
  // Method to display the characters
  public void display() {
    noStroke();
    
    if (this.team == "blue") {
      fill(50, 50, 255); 
    } else if (this.team == "red") {
      fill(255, 50, 50); 
    }
    
    rect(characterX, characterY, characterWidth, characterHeight);
    
    this.update();
  }
  
  // Method to update the characters
  private void update() {
    if (this.characterY + this.characterHeight != height - 50) {
      this.velocityY += this.gravity; 
    }
    
    if (this.characterY + this.velocityY + this.characterHeight > height - 50) {
      this.characterY = height - this.groundHeight - this.characterHeight;
      this.velocityY = 0;
    } else {
      this.characterY += this.velocityY; 
    }
  }
  
  // Method to make the characters jump
  public void jump() {
    if (this.characterY + this.characterHeight == height - 50) {
      this.velocityY = -30;
      this.characterY += velocityY;
    }
  };
  
  // Method to make the characters move in either direction
  public void move(String direction) {
    if (direction == "left") {
      this.characterX -= this.movementSpeed;
    } else if (direction == "right") {
      this.characterX += this.movementSpeed;
    }
  }
}
