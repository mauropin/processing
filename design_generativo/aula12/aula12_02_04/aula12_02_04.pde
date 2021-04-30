/*
 *  based on Daniel Shifmann code
 *  part of a series of experiments
 *  with image deconstruction
 *  as halftone dots 
 *  
 * 'm' turns mirror on/off
 *  keys 1, 2, 3 changes the color scheme
 *
 *  mauro.pinheiro@ufes.br
 */

import processing.video.*;

boolean mirror = false;

int vScale = 6; //try 8, 10, 16, 20
int cols, rows;
int loc;
int modo = 1;

color CLARA, ESCURA;

Capture video;

void setup() {
  size(1280, 720);
  cols = int(width / vScale);  
  rows = int(height / vScale);  
  noStroke();
  CLARA = color(255, 128, 0);
  ESCURA = color(5, 0, 85);

  video = new Capture (this, cols, rows);
  video.start();
}

void captureEvent(Capture video) {  
  video.read();
}


void draw() {

  if (modo == 1) {
    CLARA = color(255, 130, 0);
    ESCURA = color(5, 0, 85);
  } else if (modo == 2) {
    CLARA = color(20, 255, 200);
    ESCURA = color(85, 0, 0);
  } else if (modo == 3) {
    CLARA = color(255, 255, 0);
    ESCURA = color(85, 0, 85);
  }

  background(ESCURA);

  video.loadPixels();

  for (int y = 0; y < rows; y++) {
    for (int x = 0; x < cols; x++) {

      if (mirror) {
        //mirror mode
        loc = (video.width - x - 1) + y * video.width;
      } else { 
        //normal mode
        loc = x + y * video.width;
      }

      float brilho = brightness(video.pixels[loc]);      
      float percentual = map(brilho, 0, 255, 0, 1);
      //escolho uma cor relativa a posicao no degradee entre a cor mais escura e a mais clara
      color FINAL = lerpColor(ESCURA, CLARA, percentual); 

      //tamanho do diametro varia em funcao valor do brilho do video original
      float diam = map(brilho, 0, 255, vScale*0.2, vScale*2); 

      fill(FINAL);
      circle(x*vScale, y*vScale, diam);
    }
  }
}


void keyPressed() {
  if (key == 'm' || key == 'M') {
    mirror = !mirror;
  }

  if (key == '1') modo = 1;
  if (key == '2') modo = 2;
  if (key == '3') modo = 3;

}
