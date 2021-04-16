PImage caminito;
float [] R;
float [] G;
float [] B;
int total_pixels;

boolean ativo = false;

void setup() {
  size(1200, 900);
  total_pixels = width * height;
  R = new float[total_pixels];
  G = new float[total_pixels];
  B = new float[total_pixels];

  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, width, height);
  loadPixels(); //carrego a imagem no array pixels[]


  for (int i = 0; i < total_pixels; i++) {
    R[i] = red(pixels[i]);
    G[i] = green(pixels[i]);
    B[i] = blue(pixels[i]);
    //R[i] = pixels[i] >> 16 & 0xFF;
    //G[i] = pixels[i] >> 8 & 0xFF;
    //B[i] = pixels[i] & 0xFF;
  }
}

void draw() {
  if (ativo) {
    for (int i = 0; i < total_pixels; i++) {
      if (i < total_pixels/3) {
        pixels[i] = color(0, G[i], B[i]);
      } else if (i > total_pixels/3 && i < total_pixels*2/3) {
        pixels[i] = color(R[i], 0, B[i]);
      } else {
        pixels[i] = color(R[i], G[i], 0);
      }
    }
  } else {
    for (int i = 0; i < total_pixels; i++) {
      pixels[i] = color(R[i], G[i], B[i]);
    }
  }
  updatePixels();
}

void keyPressed() {
  ativo = !ativo;
}
