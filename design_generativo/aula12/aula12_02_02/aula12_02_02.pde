import processing.video.*;

Capture video;

float r = 7.5;

void setup() { 
  size(1280, 720);
  video = new Capture(this, width, height);  
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
}

void draw() {
  background(255);
  noStroke();
  float firstX;
  int linha = 0;
  float h = sqrt(sq(r) - sq(r/2));
  for (float y = 0; y < height + h; y+=h) {
    if (linha%2 == 0) { 
      firstX = 0;
    } else { 
      firstX = 1.5*r;
    }
    for (float x = firstX; x < width + r; x+=3*r) {    
      color cor = video.get((int)x, (int)y);
      fill(cor);
      hexagon(x, y, r);
    }
    linha++;
  }
}

void hexagon(float x, float y, float raio) {
  beginShape();
  for (float a = 0; a < 360; a+=60) {
    vertex(x + cos(radians(a)) * raio, y + sin(radians(a)) * raio);
  }
  endShape(CLOSE);
}

