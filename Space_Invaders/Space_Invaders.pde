PImage shipImg; 
PImage meteorImg;

float interval = 100;
int initTime; 
ArrayList<Ball> balls = new ArrayList<Ball>(); 
int totalBalls = 0;
float shipPosX, shipPosY;
//color c;

Ship myShip = new Ship();

public void settings() 
{
  //size(500, 1068);
  fullScreen();
  initTime = millis();
  shipImg = loadImage("spaceship.png");
  meteorImg = loadImage("meteor.png");
  //myShip = new Ship();
} 

void draw() 
{
  background(0);
  
  if (millis() - initTime > interval) {
    initTime = millis();
    interval = random(1000,3000);
    balls.add(new Ball());
  }
  
  for (Ball b:balls) {  
     b.fall();
    // c = b.col();
     b.create();
     if (myShip.collision(b)) {
       background(255,0,0);
       text("lose", 500, 500);
     }
  }
  
  myShip.create();  
  myShip.move();  
  myShip.col();
  shipPosX = myShip.getPosX();
  shipPosY = myShip.getPosY();
  
}
