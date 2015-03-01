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
  
  public Human(int x, int y, int mass, int tallness) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.tallness = tallness;
  }
  
  public int myEffectiveHeight() {
    return tallness;
  }
  
  public void update() {
    yVel += gravity;
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
    if (onGround) {
      yVel = -10;
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
  }
  
  public void say() {
    println("This is a test.");
  }
}
