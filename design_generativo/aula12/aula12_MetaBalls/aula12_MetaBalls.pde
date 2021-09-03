/* 
 * MetaBalls
 * A partir do codigo do Daniel Shiffman 
 * apresentado em https://youtu.be/ccYLb7cLB1I
*/

Ball[] myBalls = new Ball[10];

void setup() {
  size(600, 600);
  colorMode(HSB);
  for (int i = 0; i < myBalls.length; i++) {
    float radius = random(80, 250);
    float x = random(0.1, width-0.1);
    float y = random(0.1, height-0.1);
    myBalls[i] = new Ball(x, y, radius);
  }
}

void draw() {
  //background(51);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      int index = x + y * width;
      float sum = 0;
      for (Ball eachBall : myBalls) {
        float distance = dist(x, y, eachBall.pos.x, eachBall.pos.y);
        sum +=  22.5 * eachBall.radius / distance;
      }
      pixels[index] = color(sum, 255, 255);
    }
  }

  updatePixels();

  for (Ball eachBall : myBalls) {
   eachBall.update();
   //eachBall.show();
  }
}
