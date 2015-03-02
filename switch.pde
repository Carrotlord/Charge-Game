public class Switch {
  private int x;
  private int y;
  private int wideness;
  private boolean activated = false;
  
  public boolean isActivated() {
    return activated;
  }
  
  public Switch(int x, int y, int wideness) {
    this.x = x;
    this.y = y;
    this.wideness = wideness;
  }
  
  public void draw() {
    strokeWeight(2);
    if (activated) {
      fill(0, 128, 0);
    } else {
      fill(255, 0, 0);
    }
    rect(x - 4, y - 4, wideness, 8);
    fill(255);
    strokeWeight(1);
  }
  
  public void checkWeights() {
    for (Weight w : weights) {
      //println(w.getX());
      if (w.isOnGround() && x <= w.getX() && w.getX() <= x + wideness) {
        activated = true;
      }
    }
  }
}
