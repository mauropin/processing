import processing.video.*;

/*
 * use a função printArray(Capture.list());
 * para ver a lista de cameras instaladas
 * e na funcao Capture indique qual o elemento
 * do array que sera' camera a ser capturada
 *
 */

/* 
 * a biblioteca de video do processing tem duas classes:
 * Capture, para captura de video ao vido
 * e Movie, para abrir arquivos de video ja' gravados
 *
 */


Capture video; //cria um objeto de captura de imagem, chamado 'video'
Movie movie;

int LIVE_VIDEO = 1;
int RECORDED_VIDEO = 2;
int AMBOS = 3;
int modo = 1;

void setup() {
  size(1125, 845);
  //video = new Capture(this, "name=FaceTime HD Camera (Built-in),size=320x240,fps=30");

  /* uma maneira de capturar usando um fator de escala
   
   int vScale = 10; //try 8, 10, 16, 20
   int cols = int(width / vScale);  
   int rows = int(height / vScale);  
   
   video = new Capture (this, cols, rows);
   
   */

  video = new Capture(this, Capture.list()[0]); //captura a camera que esta' na posicao 0 do array gerado em Capture.list()
  video.start(); //inicializa a captura. Pode ser feito a qq momento, normalmente e' no setup

  movie = new Movie(this, "Bridge of Life.mp4");
  movie.loop(); //para que o video continue rodando eternamente.
  //movie.play(); //o video executa apenas uma vez e para.
}

void draw() {
  //if (video.available()) {    
  //  video.read();  
  //}
  background(255);
  if (modo == LIVE_VIDEO || modo == AMBOS) {
    image(video, 0, 0);
    if (modo == LIVE_VIDEO) movie.pause();
  }

  if (modo == RECORDED_VIDEO || modo == AMBOS) {
    movie.loop();
    image(movie, width-movie.width, height-movie.height);
  }
}

void captureEvent(Capture video) {
  video.read();
}

void movieEvent(Movie movie) {
  movie.read();
}

void keyPressed(){
  if(key == '1') modo = LIVE_VIDEO;
  if(key == '2') modo = RECORDED_VIDEO;
  if (key == '3') modo = AMBOS;
}
