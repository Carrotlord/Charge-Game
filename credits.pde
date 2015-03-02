public class Credits extends Level {
  public Credits(int levelNumber) {
    super(levelNumber);
  }
  
  public void runSetup() {
    
  }
  
  public void runDraw() {
    repaintBackground(); // very important for anti-aliasing the fonts!
    drawText("End of Demo", width/2 - 100, 150, 40, 25, 25, 112);
    drawText("Thanks for playing!", width/2 - 55, 170, 16, 25, 25, 112);
  }
  
  public void runCleanup() {
    
  }
}
