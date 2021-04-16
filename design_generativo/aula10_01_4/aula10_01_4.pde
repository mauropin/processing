PImage caminito;

void setup() {
  size(1200, 900);

  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, width, height);
  fill(0);
  rect(width/2, 0, width/2, height);
}

void draw() {
  PImage c = get(mouseX, mouseY, 100, 100);
  if(pmouseX != mouseX) set(mouseX + width/2, mouseY, c);
}
