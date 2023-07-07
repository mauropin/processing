/* 
 * MetaBalls
 * A partir do codigo do Daniel Shiffman 
 * apresentado em https://youtu.be/ccYLb7cLB1I
*/

Ball [] myBalls;

void setup() {
  size(600, 600);
  colorMode(HSB);

  myBalls = new Ball[10];

  for (int i = 0; i < myBalls.length; i++) {
    float x = random(width);
    float y = random(height);
    myBalls[i] = new Ball(x, y);
  }
}

void draw() {
  background(0);
  loadPixels();
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int index = y * width + x;
      float soma = 0;
      for (Ball b : myBalls) {
        float d = dist(b.x, b.y, x, y); //calcula a distancia da bola ao pixel
        soma += b.r * 12.5 / d; //soma o valor da distancia, acumulando o total para todas as bolas
      }
      pixels[index] = color(soma, 255, 255);//altera a cor do pixel de acordo com o total de distancias
    }
  }
  updatePixels();
  for (Ball b : myBalls) {
    //b.desenha();
    b.move();
  }
}



class Ball {
  float x, y, inc_x, inc_y, r;

  Ball(float x, float y) {
    this.x = x;
    this.y = y;
    inc_x = random(-5, 5);
    inc_y = random(-5, 5);
    r = 120;
  }


  void desenha() {
    noFill();
    stroke(255);
    circle(x, y, r);
  }

  void move() {
    x += inc_x;
    y += inc_y;

    if (x > width || x < 0) inc_x *= -1;
    if (y > height || y < 0) inc_y *= -1;
  }
}
