class Ball {
  PVector position;
  float x, y;
  float easing = 0.1;
  float targetX, targetY;
  float dx, dy;
  float radius;
  float direction;
  color c;
  boolean isCollide;
  ArrayList<PVector> history; 
  float pathInterval = 100;
  
  Ball(float locx, float locy) {
    radius = random(5,30);
    position = new PVector(locx, locy);
    history = new ArrayList<PVector>();
    direction = 1;
    isCollide = false;

    c = color(random(255), random(255), random(255));
  }
  
  void fall() {
    if (random(100) > 50) {
       if (millis() - initPath > pathInterval) {
           targetX = random(-8,8);
           targetY = random(-12,12);
           initPath = millis();
           pathInterval = random(500,2000);
       }
    }
    else {
       if (millis() - initTime > pathInterval) {
         targetX = random(-8,8);
         targetY = random(-12,12);
         initPath = millis();
         pathInterval = random(500,1000);
     }
    }

    position.add(targetX * direction, targetY);
    
    PVector v = new PVector(position.x, position.y);
    noStroke();
    history.add(v);
    
    for (int i = 0; i < history.size(); i++) {
      PVector current = history.get(i);
      if (current.y > height + radius || current.y < -radius) {
        history.remove(i);
      }
    }
    
    if (position.x > width - radius || position.x < 1268 + radius) {
      direction *= -1;
    }
  }
  
  void create() {
   pushStyle();
   fill(c);
   ellipse(position.x, position.y, radius*2, radius*2);
   popStyle();
   
   for (int i = 0; i < history.size(); i += 2) {
      PVector current = history.get(i);
      fill(c, i/2);
      ellipse(current.x, current.y, radius*2, radius*2);
   }
  }
}
