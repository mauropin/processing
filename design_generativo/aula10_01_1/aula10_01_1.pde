PImage caminito;

void setup() {
  size(1200, 900);
  caminito = loadImage("../data/caminito.jpg");
 }

void draw() {
  background(255);
  image(caminito, 0, 0, width, height);
  
  //imageMode(CENTER);
  //noTint();
  //image(caminito, mouseX, mouseY-150, 400, 300);
  //tint(255, 120);
  //image(caminito, mouseX, mouseY+150, 400, 300);
}
