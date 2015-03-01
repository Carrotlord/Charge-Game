public class Weight {
  private int mass = 2;
  private int x = 0;
  private int y = 0;
  private int yVel = 0;
  private int xVel = 0;
  private int charge = 0;
  private int wideness = 20;
  
  public Weight(int x, int y, int charge, int mass, int wideness) {
    this.x = x;
    this.y = y;
    this.charge = charge;
    this.mass = mass;
    this.wideness = wideness;
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
    }
  }
}
