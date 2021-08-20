PImage caminito;

void setup() {
  size(1200, 900);

  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, width, height);
  cursor(CROSS);
}

void draw() {
  color c = get(mouseX, mouseY); //armazeno a cor do pixel na posicao mouseX, mouseY na variavel 'c'
  float R = red(c);
  float G = green(c);
  float B = blue(c);
  stroke(0);
  strokeWeight(5);  
  fill(R, 0, 0);
  square(10, 10, 50);
  fill(0, G, 0);
  square(60, 10, 50);
  fill(0, 0, B);
  square(110, 10, 50);
}
