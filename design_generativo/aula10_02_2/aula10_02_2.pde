int total_pixels;
void setup() {
  size(1200, 900);
  total_pixels = width * height; //guardar o n. de pixels total da tela
}

void draw() {
  background(0);
  loadPixels(); //carrego a imagem atual da tela no array pixels[]
  for (int i = 0; i < total_pixels; i++) {
    if (i%10 == 0 || i%10 == 1) { //se i for 0, 1, 10, 11, 20, 21...
      pixels[i] = color(random(255));
    }
  }
  updatePixels();//atualizo a tela com as modificações feitas no array pixels[]
}
