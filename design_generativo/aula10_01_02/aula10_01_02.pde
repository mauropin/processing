PImage caminito;

void setup() {
  size(1200, 900);

  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, width, height);
}

void draw() {
  color c = get(mouseX, mouseY);
  fill(c);
  stroke(0);
  strokeWeight(5);  
  square(10, 10, 50);
}
