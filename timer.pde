public class Timer {
  int start = 0;
  int expirationLength = 0;
  boolean expired = false;
  
  public Timer(int frameStart, int expirationLength) {
    start = frameStart;
    this.expirationLength = expirationLength;
  }
  
  public void update(int currentFrameCount) {
    if (currentFrameCount - start > expirationLength) {
      expired = true;
    }
  }
  
  public boolean isExpired() {
    return expired;
  }
}
