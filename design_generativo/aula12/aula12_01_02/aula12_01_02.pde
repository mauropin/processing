import processing.video.*;

Capture video;
boolean pausa = false;

void captureEvent(Capture video) {
  video.read();
}
void setup(){
 size(800, 600);
 video = new Capture(this, 800, 600);
 video.start();
}
void draw(){
 background(0);
 image(video, 0, 0);
}
void keyPressed(){
 if(pausa) video.start();
 if(!pausa) video.stop();
 pausa = !pausa;
}
