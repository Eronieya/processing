int num = 10000;

float[] xpos;
float[] ypos;
float[] rad;

int index;
float minRad = 1;
float maxRad = 3;

void setup() {
  size(1600, 900);
  background(70, 40, 20);
  noStroke();
  fill(255);

  xpos = new float[num];
  ypos = new float[num];
  rad = new float[num];

  for (int i = 0; i<5; i++) {
    xpos[i] = random(width);
    ypos[i] = 0;
    rad[i] = random(minRad, maxRad);
    ellipse(xpos[i], ypos[i], rad[i] * 2, rad[i] * 2);
  }

  for (int i = 5; i<10; i++) {
    xpos[i] = random(width);
    ypos[i] = height;
    rad[i] = random(minRad, maxRad);
    ellipse(xpos[i], ypos[i], rad[i] * 2, rad[i] * 2);
  }

  index = 10;
}


void draw() {
  for (int t = 0; t<60; t++) {
    float randomX = random(width);
    float randomY = random(height);
    float randomRad = random(minRad, maxRad);

    int pointIndex = -1;
    float minSqDist = 999999999;
    float sqDist;

    for (int i = 0; i<index; i++) {
      sqDist = sq(randomX - xpos[i])+sq(randomY - ypos[i]);
      if(sqDist<minSqDist) {
        minSqDist = sqDist;
        pointIndex = i;
      }
    }
    
    float angle = atan2(randomY-ypos[pointIndex], randomX-xpos[pointIndex]);
    xpos[index] = xpos[pointIndex] + cos(angle) * rad[pointIndex];
    ypos[index] = ypos[pointIndex] + sin(angle) * rad[pointIndex];
    rad[index] = randomRad;
    ellipse(xpos[index], ypos[index], rad[index]*2, rad[index]*2);
    
    if(index < num - 1){
      index++;
    }
  }
}
