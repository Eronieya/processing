int num = 100;

float[] xpos;
float[] ypos;
float[] xspd;
float[] yspd;
color[] c;
float r = 4;

void setup() {
  size(1024, 800);

  xpos = new float[num];
  ypos = new float[num];
  xspd = new float[num];
  yspd = new float[num];
  c = new color[num];

  for (int i = 0; i < num; i++) {
    xpos[i] = width / 2;
    ypos[i] = height / 2;
    float angle = random(TWO_PI);
    float vel = random(1, 5);
    c[i] = #61B4E5;
    xspd[i] = cos(angle) * vel;
    yspd[i] = sin(angle) * vel;
  }
  noStroke();
}

void draw() {
  fill(#673F3F, 30);
  rect(0, 0, width, height);

  for (int i = 0; i < num; i++) {
    xpos[i] += xspd[i];
    if (xpos[i] - r < 0 || xpos[i] + r > width) {
      xpos[i] -= xspd[i];
      xspd[i] *= -1;
    }
    ypos[i] += yspd[i];
    if (ypos[i]-r<0 || ypos[i]+r>height) {
      ypos[i] -= yspd[i];
      yspd[i] *= -1;
    }

    fill(c[i]);
    ellipse(xpos[i], ypos[i], r*2, r*2);
  }

  for (int i = 0; i < num; i++) {
    for (int j = i + 1; j < num; j++) {
      if (dist(xpos[i], ypos[i], xpos[j], ypos[j]) < 80) {
        stroke(#61B4E5);
        line(xpos[i], ypos[i], xpos[j], ypos[j]);
      }
    }
  }
}
