public Human bob = null;
public Plate ground = null;
public Boat boat = null;
public ArrayList<Weight> weights = new ArrayList<Weight>();

public int gravity = 1; // Units: (pixels per frame) per frame. Force = this * mass.
public int terminalVelocity = 40; // Units: pixels per frame.
public int electricField = -2; // Units: (pixels per frame) per frame. Force = this * charge.

void setup() {
  size(700, 600);
  bob = new Human(width/2, 40, 100, 45);
  //bob.say();
  ground = makeGroundPlate(100, 30);
  boat = new Boat(80, 40, 70);
  frame.setTitle("Charge - A Game by Oliver Chu");
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
  
  bob.update();
  bob.draw();
  
  boat.update(false);
  boat.draw(false);
  //bob.jump();
  //bob.walkLeft();
  
  for (Weight w : weights) {
    w.update();
    w.draw();
  }
}
