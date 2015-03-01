public class Boat {
  private int x = 0;
  private int y = 0;
  private int yVel = 0;
  private int wideness = 80;
  private int tallness = 18;
  
  public Boat(int x, int y, int wideness) {
    this.x = x;
    this.y = y;
    this.wideness = wideness;
  }
  
  public int myEffectiveHeight() {
    return tallness;
  }
  
  public void update() {
    yVel += gravity;
    
    // Must update y value BEFORE ground collision, or else will appear boat is temporarily in the ground.
    y += yVel;
    
    // Ground collision detection:
    int groundLimit = height - ground.getTallness() - 1;
    if (y > groundLimit) {
      yVel = 0;
      y = groundLimit;
    }
    
    
  }
  
  public void draw() {
    strokeWeight(2);
    quad(x, y,
         x + wideness, y,
         x + wideness + tallness, y - tallness,
         x - tallness, y - tallness);
    strokeWeight(1);
  }
}
