import processing.video.*;

Capture video;

void setup(){
  size(1280, 720);
  video = new Capture(this, width, height);
  video.start();
}

void draw(){
  background(0);
  image(video, 0, 0, mouseX, mouseY);
}

void captureEvent(Capture video){
  video.read();
}
