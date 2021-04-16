Ball [] balls;
PImage caminito;
float interspace;


void setup() {
  size(1200, 900);
  //fullScreen();
  interspace = 10;
  armazena_imagem();

  balls = new Ball[0];
  cria_bolas();
  println("interspace", interspace);
}

void draw() {
  background(0);
  for (int i = 0; i < balls.length; i++) {
    balls[i].display();
  }
}

void armazena_imagem() {
  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, width, height);
  loadPixels(); //carrego a imagem no array pixels[]
}

void cria_bolas() {
  for (int y = 0; y < height; y+=interspace) {
    for (int x = 0; x < width; x+=interspace) {
      int i = y * width + x;
      color c = pixels[i];
      balls = (Ball[]) expand(balls, balls.length + 1);
      balls[balls.length - 1] = new Ball(x, y, interspace, c);
    }
  }
}

void apaga_bolas(){
  while(balls.length > 0){
    balls = (Ball[]) shorten(balls);
  }
}


class Ball {
  float x, y, d;
  color c;

  Ball(float tx, float ty, float td, color tc) {
    x = tx;
    y = ty;
    d = td;
    c = tc;
  }

  void display() {
    fill(c);
    noStroke();
    float distancia = dist(mouseX, mouseY, x, y);
    float diagonal = sqrt(sq(width) + sq(height));
    d = map(distancia, 0, diagonal, interspace, 1); 
    //rectMode(CENTER);
    //square(x, y, d);
    circle(x, y, d);
  }
}


void keyPressed() {
  if (keyCode == UP && interspace < 50) {
    apaga_bolas();
    interspace+=2;
    cria_bolas();
  }
  if (keyCode == DOWN && interspace > 4) {
    apaga_bolas();
    interspace-=2;
    cria_bolas();
  }
  println("interspace", interspace);
  
  if(key == 's' || key == 'S') saveFrame("aula10_04_1.png");
}
