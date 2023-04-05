int d = 8;

void setup() {
  size(1000, 1000); 
}

void draw() {
  background(255);
  
  draw_board();
}

void draw_board() {
  noStroke();
  
  for (int i = 0; i < d; i++) {
    for (int j = 0; j < d; j++) {
      if ((i + j) % 2 == 0) {
        fill(235, 221, 202); 
      } else {
        fill(196, 157, 118);
      }
      
      rect(i * 100 + 100, j * 100 + 100, 100, 100);
    }
  }
  
  stroke(80);
  strokeWeight(2);
  line(100, 100, 100, 900);
  line(100, 100, 900, 100);
  line(100, 900, 900, 900);
  line(900, 100, 900, 900);
  
  fill(0);
  textSize(40);
  text("A", 140, 950);
  text("B", 240, 950);
  text("C", 340, 950);
  text("D", 440, 950);
  text("E", 540, 950);
  text("F", 640, 950);
  text("G", 740, 950);
  text("H", 840, 950);
  
  text("1", 50, 160);
  text("2", 50, 260);
  text("3", 50, 360);
  text("4", 50, 460);
  text("5", 50, 560);
  text("6", 50, 660);
  text("7", 50, 760);
  text("8", 50, 860);
}
