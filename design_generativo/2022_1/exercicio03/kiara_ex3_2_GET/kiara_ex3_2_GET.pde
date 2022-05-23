//x=100 y=110

int x, y, w, h, a, s, r, g, b, r2, g2, b2, c;
int incX, incY;
boolean ligado = false;
void setup() {
  size(360, 360);
  w = 120;
  h = 140;
  x = width/2 - w/2;
  y = height/2 - h/2;
  incX = 1;
  incY = -1;
}

void draw() {
  a = x+60;
  s = y+90;
  background(255);
 
  if (ligado) {
    r = 255;
    g = 242;
    b = 93;
    r2 = 255;
    g2 = 242;
    b2 = 93;
    c = 0;
    background(0);
  
  } else {
    background(255);
    r = 216;
    g = 154;
    b = 59;
    r2 = 113;
    g2 = 56;
    b2 = 17;
    c = 255;
  }
  fill(c);
  noStroke();
  rect(x, y, w, h);
  //incremento o valor de x e y
  x+=incX;
  y+=incY;
  //verifico se a posicao do retangulo ultrapassou os limites da tela
  //e, caso verdadeiro, inverto o valor de incremento
  if(x+w > width || x < 0){  incX *= -1; }
  if(y+h > height || y < 0){  incY *= -1; }
    
//corpo
fill(201,103,43);
ellipse(a-30,s,60,100);
ellipse(a+30,s,60,100);
fill(245,132,62);
ellipse(a,s,60,100);

//rosto
  //olhos
  stroke(r2,g2,b2);
  strokeWeight(3);
  fill(r,g,b);
  triangle(a-40,s-25,a-20,s,a-40,s);
  triangle(a+40,s-25,a+40,s,a+20,s);
  
  //nariz
  quad(a,s,a+10,s+10,a,s+7,a-10,s+10);
  
  //boca
  noStroke();
  fill(r2,g2,b2);
  triangle(a-40,s+10,a-20,s+30,a-20,s+40);
  triangle(a+20,s+30,a+20,s+40,a+40,s+10);
  quad(a-20,s+30,a-20,s+40,a,s+30,a,s+20);
  quad(a+20,s+30,a+20,s+40,a,s+30,a,s+20);
 
//chapéu
fill(111,77,142);
ellipse(a,s-50,120,20);
fill(143,93,188);
triangle(a,s-90,a-30,s-50,a+30,s-50);
}
void mousePressed() {
  
 color LARANJA1 = color(201,103,43);
 color LARANJA2 = color(245,132,62);
 color ROXO1 = color(143,93,188);
 color ROXO2 = color(111,77,142);
 color AMARELO1 = color(r, g, b);
 color AMARELO2 = color(r2, g2, b2);
 
 color c = get(mouseX, mouseY);
 
 if(c == LARANJA1 || c == LARANJA2 || c == ROXO1 || c == ROXO2 || c == AMARELO1 || c == AMARELO2){
   ligado = !ligado;
 } 
 
  //if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
  //  ligado = !ligado;
  //}
}
