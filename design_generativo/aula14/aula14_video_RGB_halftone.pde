/*
 *  decomposicao da imagem da webcam a partir
 *  do componentes RGB dos pixels
 *  cada componente vira um retangulo, de altura
 *  proporcional ao valor do componente 
 *
 * 'm' liga/desliga o espelhamento (mirror)
 * 's' salva um frame
 * 'r' liga/desliga a funcao de salvar sequencia de frames
 *
 */

import processing.video.*;

boolean desenha = false;
boolean salva = false;
boolean recording = false;
boolean mirror = false;

int cellSize = 20; //try 8, 10, 16, 20
int cols, rows;

Capture video;

void setup() {
  //fullScreen();
  //size(1280, 720); 
  //size (800, 450); 
   size (1000, 562);

  video = new Capture (this, width, height);
  video.start();

  background(220, 200, 0);
}

void captureEvent(Capture video) {  
  video.read();
  noStroke();
}


void draw() {
  if (recording) saveFrame("data/video_RGB_halftone_FRAME_"+timestamp()+".png");

  background(0);
  noStroke();
  video.loadPixels();
  int i;
  for (int y = 0; y < height; y+=cellSize) {
    for (int x = 0; x < width; x+=cellSize) {

      if(mirror){
        //mirror mode
         i = (video.width - x - 1) + y * video.width;
      } else { 
        //normal mode
         i = x + y * video.width;
      }
      
      float r = red  (video.pixels[i]);      
      float g = green(video.pixels[i]);      
      float b = blue (video.pixels[i]);         

      float rh = map(r, 0, 255, 0, cellSize);
      float gh = map(g, 0, 255, 0, cellSize);
      float bh = map(b, 0, 255, 0, cellSize);

      fill(255, 0, 0);
      rect(x + (cellSize/3)*0, y, cellSize/3, rh);
      fill(0, 255, 0);
      rect(x + (cellSize/3)*1, y, cellSize/3, gh);
      fill(0, 0, 255);
      rect(x + (cellSize/3)*2, y, cellSize/3, bh);
    }
  }
  if (salva) {
    saveFrame("data/video_RGB_halftone"+timestamp()+".png");
    salva = false;
  }
}


void keyPressed() {
  desenha = true;
  if (key == 's' || key == 'S') {
    salva = true;
  }
  if (key == 'r' || key == 'R'){
    recording = !recording;
  }

  if(key == 'm' || key == 'M'){
    mirror = !mirror;
  }

  if (key == CODED) {
    if (keyCode == UP) {
      cellSize++;
    }
    if (keyCode == DOWN && cellSize > 6) {
      cellSize--;
    }
  }
}


//returns the date in yearmonthday_hourminutesecond
String timestamp() {
  return(
    year()
    +"-"+
    nf(month(), 2)
    +"-"+
    nf(day(), 2)
    +"_"+
    nf(hour(), 2)
    +"h"+
    nf(minute(), 2)
    +"m"+
    nf(second(), 2)
    +"s"
    );
}
