class Ship {
  float w, h;
  float locx, locy;
  float t, p = 0; 
  color c; 
  
  Ship() {
    w = 40;
    h = 40;
    locx = width/2;
    locy = height/2;
  }
  
  void move() {
    t += random(0.005,0.01);
    p += random(0.005,0.01);
    locx = noise(t);
    locy = noise(p);
    locx = map(locx, 0, 1, 1268+w, width-w);
    locy = map(locy, 0, 1, w, height-w);
  }
  
  void create() {
    c = color(0,0,0);
    pushStyle();
    fill(c);
    ellipse(locx, locy, w, h);
    popStyle();
  }
  
  boolean collision(Ball b) {
    float distance = dist(locx,locy,b.position.x,b.position.y);
    
    if (distance < w/2 + b.radius) {
      return true;
    }
    else {
      return false;
    }
  }
}
