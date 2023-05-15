class Button {
  private int x;
  private int y;
  private int rect_width;
  private int rect_height;
  private String text;
  private int destination;
  
  public Button(int x, int y, String text, int destination) {
    this(x, y, 750, 100, text, destination);
  }
  public Button(int x, int y, int rect_width, int rect_height, String text, int destination) {
    this.x = x;
    this.y = y;
    this.rect_width = rect_width;
    this.rect_height = rect_height;
    this.text = text;
    this.destination = destination;
  }
  
  public void display() {
    imageMode(CENTER);
    fill(0);
    rect(this.x, this.y, this.rect_width, this.rect_height, 10, 10, 10, 10);
    
    fill(255);
    textAlign(CENTER, CENTER);
    text(this.text, this.x + this.rect_width / 2, this.y + this.rect_height / 2);
  }
  
  public void display(int fill) {
    imageMode(CENTER);
    fill(0);
    rect(this.x, this.y, this.rect_width, this.rect_height, 10, 10, 10, 10);
    
    fill(fill);
    textAlign(CENTER, CENTER);
    text(this.text, this.x + this.rect_width / 2, this.y + this.rect_height / 2);
  }
  
  public void hoverChangeColor() {
    if (mouseX >= this.x && mouseX <= this.x + this.rect_width && mouseY >= this.y && mouseY <= this.y + this.rect_height) {
      this.display(100);
    } else {
      this.display();
    }
  }
    
  public int isMouseClicked(int current_scene) {
    if (mouseX >= this.x && mouseX <= this.x + this.rect_width && mouseY >= this.y && mouseY <= this.y + this.rect_height) {
      return destination;
    }
    
    return current_scene;
  }
}
