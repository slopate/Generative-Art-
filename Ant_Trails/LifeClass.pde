class Life {
  float w, h;
  color c;
  
  Life() {
    w = 47;
    h = 30;
    c = color(0,255,0);
  }
  
  void spawnLife (float x, float y) {
    rect(x,y,w,h);
  }
}
