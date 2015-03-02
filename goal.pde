public class Goal {
  private int x = 0;
  private int y = 0;
  private Timer timer = null;
  private int expirationLength = 0;
  
  public Goal(int x, int y, int expirationLength) {
    this.x = x;
    this.y = y;
    this.timer = null;
    this.expirationLength = expirationLength;
  }
  
  public void update() {
    if (timer != null) {
      timer.update(frameCount);
      if (timer.isExpired()) {
        nextLevel();
        // nextLevel() will delete this current goal.
      }
    }
    if (timer == null || !timer.isExpired()) {
      drawText("Level complete!", x, y, 32, 0, 128, 0);
      x -= 15;
      //println("x = " + x);
      if (x < width/2 - 100) {
        x = width/2 - 100;
        if (timer == null) {
          timer = new Timer(frameCount, expirationLength);
        }
      }
    }
  }
}
