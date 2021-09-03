/* 
 * MetaBalls
 * A partir do codigo do Daniel Shiffman 
 * apresentado em https://youtu.be/ccYLb7cLB1I
*/

class Ball {
  PVector pos;
  float radius;
  PVector vel;

  Ball(float x, float y, float radius) {
    pos = new PVector(x, y);
    vel = PVector.random2D();
    vel.mult(random(2, 5));
    this.radius = radius;
  }

  void update() {
    pos.add(vel); 
    if (pos.x > width || pos.x < 0) {
      vel.x *= -1;
    }
    if (pos.y > height || pos.y < 0) {
      vel.y *= -1;
    }
  }

  void show() {
    noFill();
    stroke(255);
    strokeWeight(2);
    circle(pos.x, pos.y, radius*2);
  }
}
