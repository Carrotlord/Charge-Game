// static variables go up here, OUTSIDE the class

public class Human {
  private int x = 0;
  private int y = 0;
  private int mass = 100;
  private int tallness = 50;
  private int wideness = 20; // wideness of head
  
  public Human(int x, int y, int mass, int tallness) {
    this.x = x;
    this.y = y;
    this.mass = mass;
    this.tallness = tallness;
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
