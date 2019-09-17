float interval = 100;
int initTime; 
int initPath;
ArrayList<Ball> balls = new ArrayList<Ball>(); 
int lifeCount = 0;
float n, m;
float r = 255;
float g = 255;
float blu = 255;

Life[] lives = new Life[15];
Ship myShip = new Ship();

float[] panelX = {1,119,166,234,342,527,574,679,741,788,835,884,929,976,1085};
float[] panelY = {806,862,832,832,862,832,802,802,860,860,830,955,801,831,929};

void setup() 
{
  //frameRate(50);
  fullScreen(P2D);
  initTime = millis();
  initPath = millis();
  for (int i = 0; i < 15; i++) {
    lives[i] = new Life();
  }
} 

void draw() 
{
  // Draw background, Red value set to fade
  background(r,g,blu);
  
  // Spawn lives (side panels)
  for (int i = 0; i< 15; i++) {
    fill(lives[i].c);
    lives[i].spawnLife(panelX[i], panelY[i]);
  }
  
  n = random(1450, width-180);
  m = random(330, height-330);
  
  // Spawn new balls randomly 
  if (millis() - initTime > interval) {
    initTime = millis();
    interval = random(1000,3000);
    balls.add(new Ball(n, m));
  }
  
  // Create new balls and check for collisions 
  for (int i = balls.size()-1; i >= 0; i--) {  
     Ball b = balls.get(i);
      b.create();
      b.fall();
    
     // CHeck for collisions
     if (myShip.collision(b) && b.isCollide == false) {
       r = 160;
       g = 0;
       blu = 0;
       lifeCount += 1;
       b.isCollide = true;
       lives[lifeCount -1 ].c = color(255,0,0);
       
     }
     else if (!myShip.collision(b))  {
       b.isCollide = false;
     }
  }
  
  // If reached end of lives, reset
  if (lifeCount == 15) {
     lifeCount = 0;
     r = -400;
     g = -400;
     blu = -400;
   
     for (int j = 0; j < 15; j++) {
       lives[j].c = color(0,255,0);
     }
     
     for (int k = balls.size()-1; k >= 0; k--) {
       balls.remove(k);
     }
  }
  
  // Fade background colors
  if (r < 255) {
    r += 15;
  }
  if (g < 255) {
    g += 15;
  }
  if (blu < 255) {
    blu += 15;
  }
  
  // Create ship 
  myShip.create();  
  myShip.move();  
}
