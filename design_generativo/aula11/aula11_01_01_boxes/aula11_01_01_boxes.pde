Tile [] tiles;
PImage picture;
float tile_size;

boolean distort = true; // inicializo a variavel que vai controlar se a distorcao esta' ligada ou desligada
boolean salvando = false; // inicializo a variavel que vai controlar se a funcao salvar esta' ligada ou desligada

int modo = 1; // inicializo a variavel que vai controloar o modo de distorcao


void setup() {
  size(1024, 688, P3D);
  tile_size = 6; // defino a largura do tile
  create_tiles();
  println("tile_size:", tile_size);
  cursor(CROSS);
}


void draw() {
  background(50, 90, 150);
  directionalLight(250, 250, 250, 0, 0, -1);
  //ambientLight(90, 90, 90);
  
  for (int i = 0; i < tiles.length; i++) {
    tiles[i].display();
  }  
  if (salvando) saveFrame("data/tiled_distortion_" + dia_hora() +".png");
}



/* CRIA OBJETOS Tile, PREENCHENDO O ARRAY tiles */
void create_tiles() {
  background(50, 90, 150);

  /* carrega imagem - ALTERE O CAMINHO DA IMAGEM PARA USAR UM ARQUIVO DO SEU COMPUTADO */
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

// apaga o array tiles() inteiro
void delete_tiles() {
  while (tiles.length > 0) {
    tiles = (Tile[]) shorten(tiles);
  }
}


/* A CLASSE TILE */

class Tile {
  float x, y, d;
  color c;

  //o construtor da classe
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
  //aumenta o tamanho do tile
  if (keyCode == UP && tile_size < 50) {
    delete_tiles();
    tile_size+=2;
    create_tiles();
  }
  //reduz o tamanho do tile
  if (keyCode == DOWN && tile_size > 2) {
    delete_tiles();
    tile_size-=2;
    create_tiles();
  }

  if (key == ' ') distort = !distort; //liga / desliga a funcao de distorcao

  if (key == '1') modo = 1; // altera o modo de distorcao
  if (key == '2') modo = 2; // altera o modo de distorcao

  println("tile_size", tile_size);

  if (key == 's' || key == 'S') salvando = !salvando;  // liga/desliga a funcao de salvar frames
}


/* Retorna um String com a data, no formato AAA-MM-DD_HHhMMmSSs (ex: 2021-04-23_10h20m10s) */
String dia_hora() {
  return(year() + "-" + nf(month(), 2) + "-" +  nf(day(), 2) + "_" +  nf(hour(), 2) + "h" + nf(minute(), 2) + "m" + nf(second(), 2) + "s");
}
