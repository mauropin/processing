import processing.video.*;
PGraphics layer;
float ball_x, ball_y, inc_x, inc_y;
Capture video;

void setup() {
  size(1280, 720);
  video = new Capture (this, width, height);
  video.start();
  
  layer = createGraphics(width, height);
  
  ball_x = width/2;
  ball_y = height/2;
  inc_x = random(-5, 5);
  inc_y = random(-5, 5);
}

void captureEvent(Capture video) {
  video.read();
  noStroke();
}


void draw() {
  image(video, 0, 0);
  bola_escondida();
  //image(layer, 0, 0);
 
  loadPixels();
  video.loadPixels();
  layer.loadPixels();

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
       int loc = y * width + x;
       float c = brightness(layer.pixels[loc]);
       
       //preto
       if(c < 127){
         pixels[loc] = color(brightness(video.pixels[loc]));    
       } else {
         pixels[loc] = video.pixels[loc];
       }
    }
  }
  
  updatePixels();
  
}

void bola_escondida() {
  float diametro = 350;
  layer.beginDraw();
  layer.background(0);
  layer.fill(255);
  layer.circle(ball_x, ball_y, diametro);
  layer.endDraw();
  ball_x += inc_x;
  ball_y += inc_y;
  if (ball_x +  diametro/2 > width || ball_x - diametro/2 < 0) inc_x *=-1;
  if (ball_y +  diametro/2 > height || ball_y - diametro/2 < 0) inc_y *=-1;
}
