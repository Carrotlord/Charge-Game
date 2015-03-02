public class Boat {
  private int x = 0;
  private int y = 0;
  private int yVel = 0;
  private int wideness = 80;
  private int tallness = 18;
  private boolean removed = false;
  private int mass = 2; // A boat and a human are roughly equal in mass
  
  private Weight[] upperWeights = {null, null, null, null};
  private Weight[] lowerWeights = {null, null, null, null};
  
  public Boat(int x, int y, int wideness) {
    this.x = x;
    this.y = y;
    this.wideness = wideness;
  }
  
  public int myEffectiveHeight() {
    return tallness;
  }
  
  public void removeMe() {
    removed = true;
  }
  
  public void update(boolean ignoreRemoved) {
    if (!removed || ignoreRemoved) {
      yVel += gravity;
      
      // Must update y value BEFORE ground collision, or else will appear boat is temporarily in the ground.
      y += yVel;
      
      // Ground collision detection:
      int groundLimit = height - ground.getTallness() - 1;
      if (y > groundLimit) {
        yVel = 0;
        y = groundLimit;
      }
    }
  }
  
  public void move(int newX, int newY) {
    x = newX;
    y = newY;
  }
  
  public int getWideness() {
    return wideness;
  }
  
  public int getTallness() {
    return tallness;
  }
  
  private void drawRope(int x, int y, int x2, int y2) {
    strokeWeight(2);
    line(x, y, x2, y2);
    strokeWeight(1);
  }
  
  public void drawWeights() {
    for (int i = 0; i < upperWeights.length; i++) {
      Weight currentWeight = upperWeights[i];
      if (currentWeight != null) {
        // Move the weight to the right place.
        int step = wideness / 5;
        switch (i) {
          // Draw ropes connected to weights here.
          case 0:
            currentWeight.move(x - step - 7, y - tallness * 5);
            drawRope(x - currentWeight.getWideness()/2 - 1, y - tallness,
                     x - currentWeight.getWideness()/2 - 1, y - (int) (tallness * 4.5));
            break;
          case 2:
            currentWeight.move(x + step - 7, y - tallness * 5);
            drawRope(x + 2*step - currentWeight.getWideness()/2 - 1, y - tallness,
                     x + 2*step - currentWeight.getWideness()/2 - 1, y - (int) (tallness * 4.5));
            break;
          case 3:
            currentWeight.move(x + 3*step, y - tallness * 5);
            drawRope(x + (int)(4.5*step) - currentWeight.getWideness()/2 - 1, y - tallness,
                     x + (int)(4.5*step) - currentWeight.getWideness()/2 - 1, y - (int) (tallness * 4.5));
            break;
          case 1:
            currentWeight.move(x + 5*step, y - tallness * 5);
            drawRope(x + (int)(6.5*step) - currentWeight.getWideness()/2 - 1, y - tallness,
                     x + (int)(6.5*step) - currentWeight.getWideness()/2 - 1, y - (int) (tallness * 4.5));
            break;
          default:
            break;
        }
        currentWeight.draw(); // DO NOT .update() the weight. We don't want it to move.
      }
    }
  }
  
  public void draw(boolean ignoreRemoved) {
    if (!removed || ignoreRemoved) {
      strokeWeight(2);
      quad(x, y,
           x + wideness, y,
           x + wideness + tallness, y - tallness,
           x - tallness, y - tallness);
      strokeWeight(1);
      drawWeights();
    }
  }
  
  public void attachWeight(Weight w) {
    addToWeightArray(w);
  }
  
  public void releaseWeight(boolean isUpperWeight, int index) {
    
  }
  
  private void addToWeightArray(Weight w) {
    Weight[] writeTo;
    if (w.getCharge() > 0) {
      writeTo = upperWeights;
    } else {
      writeTo = lowerWeights;
    }
    for (int i = 0; i < writeTo.length; i++) {
      if (writeTo[i] == null) {
        writeTo[i] = w;
        break;
      }
    }
  }
  
  // Retrieves acceleration caused by the weights.
  public int lift() {
    int liftAmount = 0;
    for (int i = 0; i < upperWeights.length; i++) {
      if (upperWeights[i] != null) {
        liftAmount += gravity + (upperWeights[i].getCharge() / 100) * electricField;
      }
      if (lowerWeights[i] != null) {
        liftAmount += gravity + (lowerWeights[i].getCharge() / 100) * electricField;
      }
    }
    return liftAmount;
  }
}
