class Ball {
  float locx, locy; 
  float speedy, speedx; 
  float radius;
  float direction;
  color c;
  
  Ball() {
    radius = random(5,30);
    locx = random(900 + radius, width - radius);
    locy = -radius;
    speedx = random(-0.5, 0.5);
    speedy = random(0.5, 3);
    direction = 1;
    //pushStyle();
    //c = color(random(255), random(255), random(255));
    //fill(c);
    //popStyle();
  }
  
  void fall() {
    locy += speedy;
    locx += speedx * direction;
    
    if (locx > width - radius || locx < 900 + radius) {
      direction *= -1;
    }
  }
  
  void create() {
   c = color(random(255), random(255), random(255));
   pushStyle();
   fill(c);
   ellipse(locx, locy, radius*2, radius*2);
   popStyle();
    //imageMode(CENTER);
   // rotate(PI/3.0);
   // image(meteorImg, locx, locy, radius, radius);
  }
  
  //color col() {
  //  return color(random(255), random(255), random(255));
  //}
}
