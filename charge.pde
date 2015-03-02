/* @author Jiangcheng Oliver Chu */
/* Written for Hackers@Berkeley Spring 2015 Hackathon */

public Human bob = null;
public Plate ground = null;
public Boat boat = null;
public ArrayList<Weight> weights = new ArrayList<Weight>();

public int gravity = 1; // Units: (pixels per frame) per frame. Force = this * mass.
public int terminalVelocity = 40; // Units: pixels per frame.
public int electricField = -2; // Units: (pixels per frame) per frame. Force = this * charge.

public PFont calibri = createFont("Calibri", 64, true);

public Goal goal = null;

void changeDrawingColor(int r, int g, int b) {
  fill(r, g, b);
}

void drawText(String txt, int x, int y, int size, int r, int g, int b) {
  textFont(calibri, size);
  fill(r, g, b);
  text(txt, x, y);
  changeDrawingColor(255,255,255);
}

/* Arrow draw function.
 * Source: https://processing.org/discourse/beta/num_1219607845.html
 */
void arrow(int x1, int y1, int x2, int y2) {
  line(x1, y1, x2, y2);
  pushMatrix();
  translate(x2, y2);
  float a = atan2(x1-x2, y2-y1);
  rotate(a);
  line(0, 0, -10, -10);
  line(0, 0, 10, -10);
  popMatrix();
}

void boldGreenArrow(int x1, int y1, int x2, int y2) {
  stroke(0, 128, 0);
  strokeWeight(2);
  arrow(x1, y1, x2, y2);
  strokeWeight(1);
  stroke(0);
}

void setup() {
  size(700, 600);
  //size(400, 400); // size of window can be changed without significantly affecting the first level
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

void goalReached() {
  if (goal == null) {
    goal = new Goal(width + 100, height / 2, 250);
  }
}

void draw() {
  repaintBackground();
  
  drawText("Goal", width/2 - 15, 30, 32, 0, 128, 0);

  boldGreenArrow(width/2 - 30, 30, width/2 - 30, 10);
  
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
  
  if (goal != null) {
    goal.update();
  }
}
