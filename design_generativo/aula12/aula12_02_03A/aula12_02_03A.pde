import processing.video.*;
int cell_size = 8;

Capture video;
boolean mirror = false;

void setup() { 
  size(1280, 720);
  video = new Capture(this, width, height);  
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
  noStroke();
}

void draw() {
  background(0);
  video.loadPixels();  
  for (int y = 0; y < height; y+=cell_size) {      
    // Begin loop for columns  
    for (int x = 0; x < width; x+=cell_size) {    
      int loc;
      // Reverse the column to mirror the image.
      if (mirror) {
        loc = (video.width - x - 1) + y * video.width;  //mirror mode
      } else { 
        loc = x + y * video.width;  //normal mode
      }
      colorMode(RGB, 255);
      color c = video.pixels[loc];
      float diam = map(brightness(c), 0, 255, 0.25, cell_size*1.75);
      float cor = map(brightness(c), 0, 255, 300, 450);

      pushMatrix();
      translate(x, y);
      float matiz = cor;
      if (matiz > 360) matiz = matiz-360;
      colorMode(HSB, 360, 100, 100);
      noStroke();
      fill(matiz, map(cor, 300, 450, 60, 100), map(cor, 300, 450, 20, 100)); 
      circle(0, 0, diam);
      popMatrix();
    }
  }
}  

void keyPressed() {
  if (key == 'm' || key == 'M') mirror = !mirror;
}

