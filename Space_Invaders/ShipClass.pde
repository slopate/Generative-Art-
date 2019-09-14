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
    //c = color(255, 255, 255);
  //  pushStyle();
    //fill(c);
  //  popStyle();
  }
  
  void move() {
    t += random(0.001,0.005);
    p += random(0.001,0.005);
    locx = noise(t);
    locy = noise(p);
    locx = map(locx, 0, 1, 900+w, width-w);
    locy = map(locy, 0, 1, w, 900-w);
  }
  
  void create() {
    pushStyle();
    //c = color(255, 255, 255);
    //fill(c);
    ellipse(locx, locy, w, h);
    popStyle();
    //imageMode(CENTER);
    //image(shipImg, locx, locy, w, h);
  }
  
  void col() {
    c = color(255, 255, 255);
    fill(c);
  }
  
  float getPosX() {
    return(locx);
  }
  
  float getPosY() {
    return(locy);
  }
  
  boolean collision(Ball b) {
    float distance = dist(locx,locy,b.locx,b.locy);
    
    if (distance < w/2 + b.radius) {
      return true;
    }
    else {
      return false;
    }
  }
  
  
}
