import processing.video.*;

Capture video;

void setup(){
  size(1280, 720);
  video = new Capture(this, width, height);
  video.start();
}

void draw(){
  loadPixels();
  video.loadPixels();
  for(int y = 0; y < video.height; y++){
    for(int x = 0; x < video.width; x++){
      int loc = x + y * video.width;
      
      float R = red(video.pixels[loc]);
      float G = green(video.pixels[loc]);
      float B = green(video.pixels[loc]);
      
      color c = color(map(mouseX, 0, width, 0, R), G, map(mouseY, 0, height, 0, B));
      pixels[loc] = c;
    }
  }
  updatePixels();
}

void captureEvent(Capture video){
  video.read();
}
