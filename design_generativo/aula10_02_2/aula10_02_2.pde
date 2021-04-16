void setup() {
  size(1200, 900);
  background(0);
  loadPixels(); //carrego a imagem no array pixels[]
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int i = y * width + x;
      if (i%10 == 0) pixels[i] = color(255);
    }
  }
  updatePixels();//atualizo a tela com as modificações feitas no array pixels[]
}

void draw() {
}
