int d = 8;

void setup() {
  fullScreen(); 
}

void draw() {
  background(255);
  
  fill(0);
  rect(500, 500, 200, 100);
  
  fill(255);
  textSize(20);
  text("This is a button", 550, 550);
}
