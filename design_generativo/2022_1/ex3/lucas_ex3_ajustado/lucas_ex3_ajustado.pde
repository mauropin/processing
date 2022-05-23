// criatura interativa
/*
 Nesse programa, a ideia é a criatura vai iniciar se movendo sozinha pela tela, sem sair da tela.
 Quando bater nos limites, retornará. Quando a criatura for clicada, sua boca aumentará e diminuirá de tamanho,
 até que cliquem novamente nela para parar.
 */

int pX;
int pY;
int raio = 100; // definindo as variaveis das posições que sera alterada e o valor do raio do circulo que abriga a criatura
int incX, incY, incBoca;
int raioBocao = 25;

boolean ligado = false;
void setup() {
  size(720, 720);
  pX = pY = width/2;
  incX = 1;
  incY = -1;
  incBoca = 1;
}
void draw() {
  background(100);
  noStroke();
  if (ligado) {
    //int raioBocao = 25;
    // se for verdadeiro, vai aumentar o raio da boca ate que seja menor que 50
    criatura(pX, pY, raioBocao);
    raioBocao+=incBoca;
    // se for falso, vai diminuir ate que seja 25
    if (raioBocao > 50 || raioBocao<25) {
      incBoca *= -1;
    }
  } else {
    // se não estiver ligado, a criatura vai continuar com boca fixa e se movendo pela tela
    criatura(pX, pY, 25);
  }
  //incremento o valor de x e y
  pX+=incX;
  pY+=incY;
  //verifico se a posicao do circulo circunscrito à criatura ultrapassou os limites da tela
  //e, caso verdadeiro, inverto o valor de incremento
  if (pX+raio > width || pX < 0) {
    incX *= -1;
  }
  if (pY+raio> height || pY < 0) {
    incY *= -1;
  }
}

// nessa função verifica se foi clicado dentro do circulo da criatura.
void mousePressed() {
  float d = dist(pX, pY, mouseX, mouseY);
  if (d < raio) {
    // se tiver dentro, altera o estado da variavel para o contrario.
    ligado = !ligado;
  }
  println(ligado);
}


//Função que desenha a criatura com boca em movimento, alterando a variavel do raio da boca
void criatura(int posX, int posY, int raioBoca) {
  fill(14, 140, 134);

  // fazendo olhos
  circle(posX, posY, 40);
  circle(posX+40, posY, 40);

  //fazendo corpo
  circle(posX+40, posY+40, 40);
  circle(posX, posY+40, 40);

  //fazendo pes
  triangle(posX, posY+60, posX-40, posY+80, posX, posY+70);
  triangle(posX+40, posY+60, posX+80, posY+80, posX+40, posY+70);

  //fazendo bocao
  fill(14, 36, 100);
  circle(posX+20, posY+40, raioBoca);

  //fazendo pupilas
  fill(255, 150, 0);
  circle(posX, posY, 20);
  circle(posX+40, posY, 20);
}
