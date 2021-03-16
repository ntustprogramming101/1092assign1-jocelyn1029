int x = 80;
int y = 160; // soldierX

PImage backgroundImg;
PImage soilImg;
PImage groundhogImg;
PImage lifeImg;
PImage robotImg;
PImage soldierImg;

int robotX=x*int(random(3,9));
int robotY=x*int(random(3,6));

int laserXStart=robotX+25;
int laserYStart=robotY+37;

int laserLength=0;
int laserXEnd=laserXStart-laserLength;
int laserYEnd=laserYStart;

// image
void setup() {
  size(640, 480, P2D);
  backgroundImg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  groundhogImg = loadImage("img/groundhog.png");
  lifeImg = loadImage("img/life.png");
  robotImg= loadImage("img/robot.png");
  soldierImg= loadImage("img/soldier.png");
}


void draw() {
  image(backgroundImg, 0, 0);
  image(soilImg, 0, x*2);
  
  //grass
  noStroke();
  fill(124, 204, 25);  
  rect(0, x*2-15, x*8, 15);

  image(groundhogImg, x*3.5, x*1);
  image(lifeImg, x*1/8, x*1/8);
  image(lifeImg, x*1, x*1/8);
  image(lifeImg, x*15/8, x*1/8);
  
  //sun
  fill(225, 225, 0);  
  ellipse(x*59/8, x*5/8, x*13/8, x*13/8);
  fill(253, 184, 19);
  ellipse(x*59/8, x*5/8, x*3/2, x*3/2);

  //robot
  image(robotImg, robotX, robotY);

  //laser
  stroke(225, 0, 0);
  strokeWeight(10);
  strokeCap(ROUND);
  laserXEnd=laserXStart-laserLength;
  laserLength++;

  laserXEnd-=2;
  laserXStart-=2;

  if (laserLength>=40) {
    laserLength=40;
  } 
  else if (laserLength<40) {
    laserXStart=robotX+25;
  };

  if (laserXEnd<=robotX-2*x) {
    laserXEnd=robotX-2*x;
  }
  if (laserXStart<=robotX-2*x) {
    laserXStart=robotX+25;
    laserXEnd=laserXStart;
    laserLength=0;
  }

  line(laserXStart, laserYStart, laserXEnd, laserYEnd);

  // soldier
  y+=4; // y=y+4
  y%= 640;
  image(soldierImg, y, x*5);
}
