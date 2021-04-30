import processing.video.*;

Capture video;

int ang = 0;

void setup(){
  size(1280, 720);
  video = new Capture(this, width, height);
  video.start();
}

void draw(){
  background(0);
  imageMode(CENTER);
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(ang));
  image(video, 0, 0, width/2, height/2);
  popMatrix();
  ang++;
}

void captureEvent(Capture video){
  video.read();
}
