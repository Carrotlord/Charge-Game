public class Weight {
  private int mass = 2;
  private int x = 0;
  private int y = 0;
  private int yVel = 0;
  private int xVel = 0;
  private int charge = 0;
  private int wideness = 20;
  private boolean onGround = false;
  
  public int getX() {
    return x;
  }
  
  public int getY() {
    return y;
  }
  
  public Weight(int x, int y, int charge, int mass, int wideness) {
    this.x = x;
    this.y = y;
    this.charge = charge;
    this.mass = mass;
    this.wideness = wideness;
  }
  
  public int getWideness() {
    return wideness;
  }
  
  public void move(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  public int getCharge() {
    return charge;
  }
  
  public void draw() {
    // A weight is a box.
    rect(x, y, wideness, wideness);
    if (charge > 0) {
      drawPlus(x + 3, y + 3, wideness - 6);
    } else if (charge < 0) {
      drawMinus(x + 3, y + 3, wideness - 6);
    }
  }
  
  public boolean isOnGround() {
    return onGround;
  }
  
  public void update() {
    // There's gravity, and there's the electric field.
    yVel += gravity + electricField * (charge / 100); // This is not the right way to do Coulomb's law, but it'll have to do for now.
    y += yVel;
    x += xVel;
    if (yVel < -terminalVelocity) {
      yVel = -terminalVelocity;
    } else if (yVel > terminalVelocity) {
      yVel = terminalVelocity;
    }
      
    // Ground collision detection:
    int groundLimit = height - ground.getTallness() - 1 - wideness;
    if (y > groundLimit) {
      yVel = 0;
      y = groundLimit;
      onGround = true;
    }
    
    // Ceiling collision detection:
    if (currentLevel == 1 && ceiling != null) {
      int ceilingLimit = ceiling.getTallness() + 1;
      if (y < ceilingLimit) {
        yVel = 0;
        y = ceilingLimit;
        // onCeiling = true;
      }
    }
    
    // Pivot plate detection:
    if (currentLevel == 1 && pivotSwitch != null && pivotSwitch.isActivated() && y < height/2) {
      xVel += electricField;
      if (xVel < -terminalVelocity) {
        xVel = -terminalVelocity;
      }
    }
  }
}
