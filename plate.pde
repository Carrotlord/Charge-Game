public class Plate {
  private int tallness = 0;
  private int wideness = 0;
  private int x = 0;
  private int y = 0;
  private boolean isVertical = false;
  private int charge = 0;
  
  public Plate(int x, int y, int tallness, int wideness, boolean isVertical, int charge) {
    this.x = x;
    this.y = y;
    this.tallness = tallness;
    this.wideness = wideness;
    this.isVertical = isVertical;
    this.charge = charge;
  }
  
  public void draw() {
    // myGlobalFxn();
    if (isVertical) {
      // TODO
    } else {
      rect(x, y, wideness, tallness);
      if (charge > 0) {
        drawPlus(x + wideness/2, y + 4, tallness - 8);
      } else if (charge < 0) {
      }
    }
  }
}
