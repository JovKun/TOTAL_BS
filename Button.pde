class Button {
  private int x;
  private int y;
  private int rect_width;
  private int rect_height;
  private String text;
  
  public Button(int x, int y, int rect_width, int rect_height, String text) {
    this.x = x;
    this.y = y;
    this.rect_width = rect_width;
    this.rect_height = rect_height;
    this.text = text;
  }
  
  public void display() {
    imageMode(CENTER);
    
    rect(this.x, this.y, this.rect_width, this.rect_height, 50, 50, 50, 50);
    
  }
  
  public void displayText(){
    fill(255);
    textAlign(CENTER, CENTER);
    text(this.text, x + this.rect_width / 2, y + this.rect_height / 2);
  }
 }
