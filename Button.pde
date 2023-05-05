class Button {
  private int x;
  private int y;
  private int rect_width;
  private int rect_height;
  private String text;
  
  public Button(int x, int y, String text) {
    this.x = x;
    this.y = y;
    this.rect_width = 750;
    this.rect_height = 100;
    this.text = text;
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
  
  public void hoverChangeColor(){
    if (mouseX >= this.x && mouseX <= this.x + this.rect_width && mouseY >= this.y && mouseY <= this.y + this.rect_height) {
      this.display(100);
    } else {
      this.display();
    }
  }
}
