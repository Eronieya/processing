int num = 80;

float xpos;
float ypos;
float rspd = random(PI / 40, PI / 80);
float cr = 0;
color c;
float r = 4;
float rr = 40;

void setup() {
  size(1024, 800);
  noStroke();
}

void draw() {
  fill(#000000, 30);
  rect(0, 0, width, height);
  cr += rspd;
  float startX = width / 2;
  float startY = height / 2;
  ypos = sin(cr) * rr + startY;
  xpos = cos(cr) * rr + startX;
  fill(#ffffff);
  //stroke(152);
  //point(width / 2, height / 2);
  ellipse(xpos, ypos, r*2, r*2);
}
