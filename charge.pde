public Human bob = null;
public Plate ground = null;

void setup() {
  size(700, 600);
  bob = new Human();
  bob.say();
  ground = makeGroundPlate(100, 30);
}

Plate makeGroundPlate(int charge, int tallness) {
  return new Plate(0, height - tallness - 1, tallness, width - 1, false, charge);
}

void repaintBackground() {
  background(190); // shade of gray
}

/* void myGlobalFxn() {
  println("Double hi!");
} */

void drawPlus(int x, int y, int w) {
  // Vertical:
  int halfWidth = w/2;
  strokeWeight(2);
  line(x+halfWidth,y,x+halfWidth,y+w);
  // Horizontal:
  line(x,y+halfWidth,x+w,y+halfWidth);
  strokeWeight(1);
}

void drawMinus(int x, int y, int w) {
  int halfWidth = w/2;
  strokeWeight(2);
  // Horizontal:
  line(x,y+halfWidth,x+w,y+halfWidth);
  strokeWeight(1);
}

void draw() {
  repaintBackground();
  ground.draw();
}
