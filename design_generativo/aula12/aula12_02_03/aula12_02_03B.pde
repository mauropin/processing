import processing.video.*;

int vScale = 6;
int cols, rows;

// Variable for capture device
Capture video;

boolean mirror = false;

void setup() { 
  size(1280, 720);
  cols = width / vScale;  
  rows = height / vScale;  
  video = new Capture(this, cols, rows);  
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
  noStroke();
}

void draw() {
  background(0);

  video.loadPixels();  
  for (int y = 0; y < rows; y++) {      
    for (int x = 0; x < cols; x++) {    
      int loc;
      if (mirror) {
        loc = (video.width - x - 1) + y * video.width; //mirror mode
      } else { 
        loc = x + y * video.width; //normal mode
      }
      colorMode(RGB, 255);
      color c = video.pixels[loc];

      float diam = map(brightness(c), 0, 255, 0.25, vScale*1.75);
      float cor = map(brightness(c), 0, 255, 300, 450);

      pushMatrix();
      translate(x*vScale, y*vScale);
      float matiz = cor;
      if (matiz > 360) matiz = matiz-360;
      noStroke();
      colorMode(HSB, 360, 100, 100);
      fill(matiz, map(cor, 300, 450, 60, 100), map(cor, 300, 450, 20, 100)); 
      circle(0, 0, diam);
      popMatrix();
    }
  }
}  

void keyPressed() {
  if (key == 'm' || key == 'M') {
    mirror = !mirror;
  }
}
