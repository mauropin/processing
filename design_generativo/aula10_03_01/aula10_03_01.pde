PImage caminito;
float [] R;
float [] G;
float [] B;
int total_pixels;

PGraphics pg;
PFont font;

void setup() {
  size(1200, 900);
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
        pixels[i] = color(0, G[i]*0.5, B[i]*0.75);
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
  //println(caminito.width, caminito.height);
  image(caminito, 0, 0, width, height);
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
  float tsize = 120;
  String texto = "Design da Informação é uma área do Design cujo propósito é a definição, planejamento e configuração do conteúdo de uma mensagem e dos ambientes em que ela é apresentada, com a intenção de satisfazer as necessidades informacionais dos destinatários pretendidos e de promover eficiência comunicativa.";
  pg = createGraphics(width, height);
  pg.beginDraw();
  pg.background(0);
  pg.fill(255);
  pg.noStroke();
  pg.textAlign(LEFT);
  pg.textFont(font);
  pg.textSize(tsize);
  pg.textLeading(tsize);
  pg.text(texto, 0, 0, width, height);
  pg.endDraw();
}

void keyPressed(){
  if(key == 's' || key == 'S') saveFrame("aula10_03_01_" + data_atual() +".png");
}

String data_atual(){
  return(year() + "-" + nf(month(), 2) + "-" +  nf(day(), 2) + "_" +  nf(hour(), 2) + "h" + nf(minute(), 2) + "m" + nf(second(),2) + "s");
}
