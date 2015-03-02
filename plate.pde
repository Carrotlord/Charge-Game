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
      rect(x, y, wideness, tallness);
      if (charge > 0) {
        drawPlus(x + 4, y + tallness/2 - 8, wideness - 8);
      } else if (charge < 0) {
        //drawMinus(x + wideness/2 - tallness/4, y + 4, tallness - 8);
      }
    } else {
      rect(x, y, wideness, tallness);
      if (charge > 0) {
        drawPlus(x + wideness/2 - tallness/4, y + 4, tallness - 8);
      } else if (charge < 0) {
        drawMinus(x + wideness/2 - tallness/4, y + 4, tallness - 8);
      }
    }
  }
  
  public int getTallness() {
    return tallness;
  }
  
  public int getWideness() {
    return wideness;
  }
}
