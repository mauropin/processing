float x, y, raio;
float incX= 2.5;
float incY= -2.5;
float treme = random(-5, 5);

boolean feliz = true;
boolean movendo = true;

void setup() {
  size(720, 720);
  colorMode(HSB, 360, 100, 100);
  x = width/2;
  y = height/2;
  raio = 100;
}
void draw() {
  background(0, 0, 100);
  noStroke();
  float d = dist(x, y, mouseX, mouseY);

  //CABECA
  if (feliz) {
    fill(28, 63, 90);
  } else {
    fill(15, 63, 90);
  }
  circle(x, y, raio);


  //ORELHAS
  //esq
  circle(x-40, y -40, 40);
  //dir
  circle(x+40, y-40, 40);

  //FOCINHO
  fill(25, 35, 93);
  circle(x, y+40, 40);
  circle(x, y+15, 40);
  quad(x-20, y+15, x+20, y+15, x+20, y+40, x-20, y+40);

  //BOCA
  if (feliz) {
    noFill();
    strokeWeight(3);
    stroke(22, 57, 58);
    arc(x, y+1, 70, 60, radians(45), radians(135));
    line(x, y-3, x, y+30);
  } else {
    noFill();
    strokeWeight(3);
    stroke(22, 57, 58);
    arc(x, y+60, 50, 60, radians(240), radians(300));
    line(x, y-3, x, y+30);
  }
  //NARIZ
  noStroke();
  fill(22, 57, 58);
  arc(x, y+12, 50, 35, radians(240), radians(300));

  //OLHOS
  if (feliz) {
    circle(x-20, y-15, 15);
    circle(x+21, y-15, 15);
  } else {
    arc(x-19, y-18.5, 15, 15, radians(15), radians(230));
    arc(x+21, y-19, 15, 15, radians(-40), radians(160));
    strokeWeight(4);
    stroke(22, 57, 58);
    line(x-10, y-15, x-28, y-26);
    line(x+10, y-15, x+28, y-26);
  }

  //LISTRAS
  //topo cabeça
  strokeWeight(4);
  stroke(22, 57, 58);
  line(x, y-49, x, y-22);
  line(x-15, y-40, x+15, y-40);
  line(x-10, y-30, x+10, y-30);
  //inferiores
  line(x-48, y+7, x-31, y+7);
  line(x-45, y+17, x-38, y+17);
  line(x+33, y+7, x+48, y+7);
  line(x+39, y+17, x+46, y+17);

  if (movendo) {
    x+= incX;
    y+= incY;
  } else {
    x = mouseX + random(-2, 2);
    y = mouseY + random(-2, 2);
  }

  if (x > width-raio/2 || x<raio/2) {
    incX *= -1;
  }
  if (y > height-raio/2 || y<raio/2) {
    incY *= -1;
  }
}


void mousePressed() {
  float d = dist(x, y, mouseX, mouseY);
  if (d<raio) {
    feliz = false;
    movendo = false;
  }
}

void mouseReleased() {
  feliz = true;
  movendo = true;
}
