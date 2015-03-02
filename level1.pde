public Plate leftWall = null;
public Plate pivotPlate = null;
public Switch pivotSwitch = null;
public Plate ceiling = null;

public class Level1 extends Level {
  public Level1(int levelNumber) {
    super(levelNumber);
  }
  
  public void runSetup() {
    bob = new Human(width/2 - 50, 40, 100, 45);
    //bob.say();
    ground = makeGroundPlate(100, 30);
    boat = new Boat(80, 40, 70);
    leftWall = new Plate(0, height/2, height/2 - ground.getTallness() - 1, 30, true, 0);
    pivotPlate = new Plate(width/2, height/2 - ground.getTallness() - 1, 30, width/2 - 1, false, 100);
    pivotSwitch = new Switch(width/2 + 100, height-ground.getTallness(), 70);
    ceiling = new Plate(0, 0, 30, width - 1, false, 0);
  }
  
  public void runDraw() {
    repaintBackground();
  
    drawText("Goal", 10, 60, 32, 0, 128, 0);
  
    boldGreenArrow(30, 75, 10, 75);
    
    ground.draw();
    
    bob.update();
    bob.draw();
    
    leftWall.draw();
    pivotPlate.draw();
    pivotSwitch.draw();
    pivotSwitch.checkWeights();
    
    if (pivotSwitch.isActivated()) {
      pivotPlate = new Plate(width - 31, 0, height/2, 30, true, 100);
    }
    
    ceiling.draw();
    
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
    leftWall = null;
    pivotPlate = null;
    pivotSwitch = null;
    repaintBackground();
  }
}
