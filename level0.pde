public class Level0 extends Level {
  public Level0(int levelNumber) {
    super(levelNumber); 
  }
  
  public void runSetup() {
    bob = new Human(width/2, 100, 100, 45);
    //bob.say();
    ground = makeGroundPlate(100, 30);
    boat = new Boat(80, 40, 70);
  }
  
  public void runDraw() {
    repaintBackground();
  
    drawText("Goal", width/2 - 15, 30, 32, 0, 128, 0);
  
    boldGreenArrow(width/2 - 30, 30, width/2 - 30, 10);
    
    ground.draw();
    
    bob.update();
    bob.draw();
    
    boat.update(false);
    boat.draw(false);
    //bob.jump();
    //bob.walkLeft();
    
    for (Weight w : weights) {
      w.update();
      w.draw();
    }
    
    if (goal != null) {
      goal.update();
    }
  }
  
  public void runCleanup() {
    bob = null;
    boat = null;
    ground = null;
    weights = new ArrayList<Weight>();
    repaintBackground();
  }
}
