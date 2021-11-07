int num = 80;

float[] xpos;
float[] ypos;
float[] startX;
float[] startY;
float[] rspd;
float[] rr;
float[] startRadius;
color[] c;
float r = 4;

float op = 50;
float way = 0.5;

float a = 0.0;
float s = 0.0;

void setup() {
  size(1024, 800);

  xpos = new float[num];
  ypos = new float[num];
  startX = new float[num];
  startY = new float[num];
  startRadius = new float[num];
  rr = new float[num];
  rspd = new float[num];
  c = new color[num];

  for (int i = 0; i < num; i++) {
    rr[i] = random(80, 160);
    rspd[i] = random(PI / (rr[i] * 1.2), PI / (rr[i] * 2));
    startRadius[i] = random(0, PI);
    startX[i] = random(width / 2.5, width / 1.5);
    startY[i] = random(height / 2.5, height / 1.5);
    c[i] = #ffffff;
  }
  noStroke();
}

void draw() {
  fill(#000000, 30);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    if (i % 2 == 0) {
      startRadius[i] += rspd[i];
    } else {
      startRadius[i] -= rspd[i];
    }

    ypos[i] = sin(startRadius[i]) * rr[i] + startY[i];
    xpos[i] = cos(startRadius[i]) * rr[i] + startX[i];

    fill(#ffffff, op);
    ellipse(xpos[i], ypos[i], r*2, r*2);
  }



  for (int i = 0; i < num; i++) {
    for (int j = i + 1; j < num; j++) {
      if (dist(xpos[i], ypos[i], xpos[j], ypos[j]) < 80) {
        stroke(#ffffff, op);
        line(xpos[i], ypos[i], xpos[j], ypos[j]);
      }
    }
  }

  if (op == 80) {
    way = -0.5;
  } else if (op == 5) {
    way = 0.5;
  }

  op+=way;
}
