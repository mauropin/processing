PImage caminito;

void setup() {
  caminito = loadImage("../data/caminito.jpg");
  size(1200, 900);
}

void draw() {
  background(0);
  if (mousePressed) {
    imageMode(CENTER);
    clip(mouseX, mouseY, 500, 500);
  } else {
    noClip();
  }
  imageMode(CORNER);
  image(caminito, 0, 0, width, height);
}
