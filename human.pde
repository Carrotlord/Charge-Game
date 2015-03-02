// static variables go up here, OUTSIDE the class

public class Human {
  private int x = 0;
  private int y = 0;
  private int xVel = 0;
  private int yVel = 0;
  private int mass = 2;
  private int tallness = 50;
  private int wideness = 20; // wideness of head
  private boolean onGround = false;
  private Boat myBoat = null;
  private Timer positiveWeightTimer = new Timer(0, 0);
  private Timer negativeWeightTimer = new Timer(0, 0);
  private Timer neutralWeightTimer = new Timer(0, 0);
  
  public boolean hasBoat() {
    return myBoat != null;
  }
  
  public Human(int x, int y, int mass, int tallness) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.tallness = tallness;
  }
  
  public int myEffectiveHeight() {
    return tallness;
  }
  
  private void checkKeyboard() {
    if (keyPressed) {
      positiveWeightTimer.update(frameCount);
      negativeWeightTimer.update(frameCount);
      neutralWeightTimer.update(frameCount);
      switch (keyCode) {
        case UP:
          jump();
          break;
        case LEFT:
          walkLeft();
          break;
        case RIGHT:
          walkRight();
          break;
        default:
          break;
      }
      switch (key) {
        case ENTER:
          // Equip a boat. Change this later to allow detection of background boat
          equipBoat(boat);
          break;
        case '=':
          if (positiveWeightTimer.isExpired()) {
            // If we're on a boat, attach the charges to the boat.
            if (hasBoat()) {
              myBoat.attachWeight(new Weight(50, 50, 100, 2, 20));
            } else {
              weights.add(new Weight(x, y, 100, 2, 20));
            }
            positiveWeightTimer = new Timer(frameCount, 7);
          }
          break;
        case '-':
          if (negativeWeightTimer.isExpired()) {
            weights.add(new Weight(x, y, -100, 2, 20));
            negativeWeightTimer = new Timer(frameCount, 7);
          }
          break;
        case '0':
          if (neutralWeightTimer.isExpired()) {
            weights.add(new Weight(x, y, 0, 2, 20));
            neutralWeightTimer = new Timer(frameCount, 7);
          }
          break;
        default:
          break;
      }
    } else {
      // Stop moving if we're not airborne.
      stand();
    }
  }
  
  public void update() {
    yVel += gravity;
    if (hasBoat()) {
      yVel += gravity; // the boat has equal mass to the person.
      yVel += myBoat.lift(); // What do the weights on the boat contribute?
    }
    if (yVel > terminalVelocity) {
      yVel = terminalVelocity;
    }
    y += yVel;
    
    // Ground collision detection:
    int groundLimit = height - ground.getTallness() - myEffectiveHeight() - 1;
    if (y > groundLimit) {
      yVel = 0;
      y = groundLimit;
      onGround = true;
    }
    
    x += xVel;
    int leftBoundary = wideness/2;
    int rightBoundary = width - wideness/2;
    if (x < leftBoundary) {
      x = leftBoundary;
      xVel = 0;
    } else if (x > rightBoundary) {
      x = rightBoundary;
      xVel = 0;
    }
    
    checkKeyboard();
  }
  
  public void walkLeft() {
    if (onGround) {
      xVel = -10;
    }
  }
  
  public void stand() {
    if (onGround) {
      xVel = 0;
    }
  }
  
  public void walkRight() {
    if (onGround) {
      xVel = 10;
    }
  }
  
  public void jump() {
    if (onGround && !hasBoat()) {
      yVel = -16;
      onGround = false;
    }
  }
  
  public void draw() {
    strokeWeight(2);
    // Head:
    ellipse(x, y, wideness, wideness);
    // Body:
    line(x, y + wideness/2 + 1, x, y + tallness - wideness/2);
    // Arms:
    line(x - wideness/2, y + wideness/2 + 10, x + wideness/2, y + wideness/2 + 10);
    // Left leg:
    line(x, y + tallness - wideness/2, x - wideness/2, y + tallness);
    // Right leg:
    line(x, y + tallness - wideness/2, x + wideness/2, y + tallness);
    strokeWeight(1);
    if (hasBoat()) {
      // Draw boat:
      myBoat.move(x - myBoat.getWideness()/2, y + tallness);
      myBoat.draw(true);
    }
  }
  
  
  public void equipBoat(Boat b) {
    b.removeMe();
    myBoat = b;
    myBoat.move(x, y);
  }
  
  /* public void say() {
    println("This is a test.");
  } */
}
