PImage caminito, spirograph;
float [] R;
float [] G;
float [] B;
int total_pixels;

PGraphics pg;
PFont font;

void setup() {
  size(1024, 768);
  //printArray(PFont.list());
  font = createFont("Roboto-Black", 50);
  mascara_fundo();
  armazena_imagem();
  background(255);
}

void draw() {
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      color c = pg.get(x, y);
      int i = y * width + x;
      if (c == color(0)) {
        pixels[i] = color(255);
      }
    }
  }
  updatePixels();
}

void armazena_imagem() {
  total_pixels = width * height;
  R = new float[total_pixels];
  G = new float[total_pixels];
  B = new float[total_pixels];

  caminito = loadImage("../data/caminito.jpg");
  image(caminito, 0, 0, 1024, 768);
  loadPixels(); //carrego a imagem no array pixels[]

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int i = y * width + x;
      //R[i] = red(pixels[i]);
      //G[i] = green(pixels[i]);
      //B[i] = blue(pixels[i]);
      R[i] = pixels[i] >> 16 & 0xFF;
      G[i] = pixels[i] >> 8 & 0xFF;
      B[i] = pixels[i] & 0xFF;
    }
  }
}

void mascara_fundo() {
  float tsize = 300;
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0);
  spirograph = loadImage("../data/spirograph.png");
  pg.image(spirograph, 0, 0, width, height);
  pg.endDraw();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame("aula10_03_2.png");
}
