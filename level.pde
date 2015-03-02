public abstract class Level {
  private int levelNumber = 0;
  
  public Level(int levelNumber) {
    this.levelNumber = levelNumber;
  }
  
  public int getLevelNumber() {
    return levelNumber;
  }
  
  public abstract void runSetup();
  
  public abstract void runDraw();
  
  public abstract void runCleanup();
}
