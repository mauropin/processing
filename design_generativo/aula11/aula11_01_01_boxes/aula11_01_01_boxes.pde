Tile [] tiles;
PImage picture;
float tile_size;
PShape seta;

boolean distort = true;
boolean salvando = false;

int modo = 1;

void setup() {
  size(1024, 688, P3D);
  //size(800, 600, P3D);
  tile_size = 6;
  create_tiles();
  println("tile_size:", tile_size);
  //seta = loadShape("../data/cursor02.svg");
  //seta.disableStyle(); //desconsidera os atributos do objeto
  cursor(CROSS);
}

void draw() {
  background(50, 90, 150);
  directionalLight(250, 250, 250, 0, 0, -1);
  //ambientLight(90, 90, 90);
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].display();
  }
  pushMatrix();
  translate(mouseX, mouseY, 100);//deslocando o eixo z acima dos boxes.
  fill(30);
  //shapeMode(CENTER);
  //shape(seta, 0, 0);
  popMatrix();
  if (salvando) saveFrame("data/tiled_distortion_" + dia_hora() +".png");
}

void create_tiles() {
  background(50, 90, 150);
  //altere o caminho da imagem para usar uma imagem do seu computador
  picture = loadImage("../data/great_wave_off_kanagawa.jpg");
  imageMode(CENTER);
  image(picture, width/2, height/2, width, height);
  loadPixels(); //carrego a imagem no array pixels[]

  tiles = new Tile[0];
  for (int y = 0; y < height; y+=tile_size) {
    for (int x = 0; x < width; x+=tile_size) {
      int i = y * width + x;
      color c = pixels[i];
      tiles = (Tile[]) expand(tiles, tiles.length + 1);
      tiles[tiles.length - 1] = new Tile(x, y, tile_size, c);
    }
  }
}

void delete_tiles() {
  while (tiles.length > 0) {
    tiles = (Tile[]) shorten(tiles);
  }
}


class Tile {
  float x, y, d;
  color c;

  Tile(float tx, float ty, float td, color tc) {
    x = tx;
    y = ty;
    d = td;
    c = tc;
  }

  void display() {
    //float r = c >> 16 & 0xFF;
    //float g = c >> 8 & 0xFF;
    //float b = c & 0xFF;

    noStroke();
    fill(c);
    float distancia = dist(x, y, mouseX, mouseY);
    float diagonal = sqrt(sq(width) + sq(height));
    float z;
    if (distort) {
      z = map(distancia, 0, 30*d, 70, d);
    } else {
      z = d;
    }
    //d = map(distancia, 0, diagonal, tile_size, 1); 
    rectMode(CENTER);
    pushMatrix();

    if (modo == 1) {
      translate(x, y, z);
      box(d*0.9, d*0.9, d*0.9);
    } else {
      translate(x, y);
      box(d*0.9, d*0.9, z);
    }
    popMatrix();
  }
}


void keyPressed() {
  if (keyCode == UP && tile_size < 50) {
    delete_tiles();
    tile_size+=2;
    create_tiles();
  }
  if (keyCode == DOWN && tile_size > 2) {
    delete_tiles();
    tile_size-=2;
    create_tiles();
  }

  if (key == ' ') distort = !distort;

  if (key == '1') modo = 1;
  if (key == '2') modo = 2;

  println("tile_size", tile_size);

  if (key == 's' || key == 'S') salvando = !salvando;
}

String dia_hora() {
  return(year() + "-" + nf(month(), 2) + "-" +  nf(day(), 2) + "_" +  nf(hour(), 2) + "h" + nf(minute(), 2) + "m" + nf(second(), 2) + "s");
}
