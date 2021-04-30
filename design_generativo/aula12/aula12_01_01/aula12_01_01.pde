import processing.video.*;

Movie filme;
boolean pausa = false;

void movieEvent(Movie filme) {
  filme.read();
}
void setup(){
 size(800, 600);
 filme = new Movie(this, "Bridge of Life.mp4");
 filme.loop(); //ou filme.play();
}
void draw(){
 background(127);
 image(filme, 0, 0);
}
void keyPressed(){
 if(pausa) filme.loop();
 if(!pausa) filme.pause();
 pausa = !pausa;
}
