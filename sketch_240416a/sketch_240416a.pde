/**
 * Continuous Lines. 
 * 
 * Click and drag the mouse to draw a line. 
 */

void setup() {
  size(640, 360);
  background(000);
}

void draw() {
  stroke(255);
  if (mousePressed == true) {
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  for (int i = 120; i < 320; i = i+20) {
  for (int j = 0; j < 320; j = j+20) {
    point(i, j);
  }
}
}
