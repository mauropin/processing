import processing.pdf.*;
Ball [] balls;
Paleta [] paletas;
Button [] buttons;

PrintWriter csvFile;

PFont Roboto, RobotoBold, RobotoCond, RobotoCondBold;

color [] cores;
color cor_fundo = color(220, 220, 192);

String [] cor_nome;
String [] txt_help;
String txt_console = "";
String valores_x, valores_y, myText, nome_pasta;
String orientacao, old_orientacao;
char escreve;

int current_ink = 1;
int primeCornerX, primeCornerY, num_pagesA4_width, num_pagesA4_height, temp_num_pages_width, temp_num_pages_height;
int num_x, num_y, old_num_x, old_num_y;

float diametro, diametro_cursor, diametro_visualizacao, cm_to_px;

/* tamanho real A4 595 x 841 (21 x 29,7 cm)// tamanho com margens 566 x 779 (20 x 27,5 cm) */
//float width_A4 = 566; float height_A4 = 779;

float width_A4 = 595;
float height_A4 = 841;

float escala = 1;
float escala_foto = 1;

PGraphics preview;
PImage fundo, header, thumb_horizontal, thumb_vertical;

boolean edicao, scrolling, show_viewer, show_help, novo, show_info, show_paleta, show_console, dragging, foto_fundo, escolhe_orientacao;


void setup() {
  size(1280, 720);    //referencia de tamanhos:  40x40cm = 1134 x 1134px / A4 =  595 x 841 px / A3 =  841 x 1190 px

  diametro = 88.7671; //3.1337cm é 88.7671px
  cm_to_px = diametro/3.1337;

  //diametro = 85.0394; //3cm é 85.0394px
  //diametro = 90.7087; //3.2cm é 90.7087px


  //carrega fontes
  int corpo = 16;
  RobotoCond = createFont("fonts/Roboto-Condensed.ttf", corpo);
  RobotoCondBold = createFont("fonts/Roboto-BoldCondensed.ttf", corpo);
  Roboto = createFont("fonts/Roboto-Regular.ttf", corpo);
  RobotoBold = createFont("fonts/Roboto-Bold.ttf", corpo);
  textFont(Roboto);

  orientacao = "horizontal";
  old_orientacao = orientacao;
  escolhe_orientacao = true;
  default_tampinhas();

  valores_x = "";
  valores_y = "";
  myText = "";
  escreve = 'x';
  cria_cores();
  cria_botoes();

  scrolling = false;
  show_viewer = true;
  show_help = false;
  show_info = false;
  show_console = true;
  show_paleta = true;
  dragging = false;
  foto_fundo = false;
  fundo = loadImage("data/fundo.jpg");

  txt_help = loadStrings("data/instrucoes.txt");
  header = loadImage("data/header3.png");
  novo = true;
  nome_pasta = data_atual();
  reset(false, orientacao);
}



///////// DRAW LOOP /////////////
void draw() {
  imageMode(CORNER);
  if (!novo) {
    background(cor_fundo);
    if (edicao) {
      if (foto_fundo) {
        pushMatrix();
        scale(escala);
        image(fundo, primeCornerX, primeCornerY, fundo.width*escala_foto, fundo.height*escala_foto);
        popMatrix();
      }
      for (Ball b : balls) {
        b.display();
        b.paint();
      }

      if (scrolling) {
        cursor(HAND);
      } else {
        if (current_ink != 0) {
          if (show_console && !dentro_console()) {
            cursor(ARROW);
          } else {
            cursor(HAND);
          }
          fill(cores[current_ink], 190);
          noStroke();
          circle(mouseX, mouseY, diametro_cursor);
        } else {
          if (show_console && !dentro_console()) {
            cursor(CROSS);
          } else {
            cursor(HAND);
          }
          noFill();
          stroke(120);
          circle(mouseX, mouseY, diametro_cursor);
        }
      }
      grid();
      count_colors(false);
      if (show_console) console_info();

      if (show_viewer) {
        cria_preview();
        sombra(width-preview.width/4-5, 0, preview.width/4+5, preview.height/4);
        fill(cor_fundo);
        rect(width-preview.width/4-5, 0, preview.width/4, preview.height/4);
        image(preview, width-preview.width/4, 0, preview.width/4, preview.height/4);
      }
    } else {
      cria_preview();
      if (orientacao.equals("horizontal")) {
        image(preview, 0, 0, preview.width*0.975, preview.height*0.975);
      } else {
        image(preview, 0, 0, preview.width*0.875, preview.height*0.875);
      }
    }


    if (show_help) mostra_instrucoes();
  } else {
    desenha_input_tampinhas();
  }
}




////// SOMBRA ////////
void sombra(float sx, float sy, float sw, float sh) {
  for (int sombra = 0; sombra < 10; sombra++) {
    float transp = map(sombra, 0, 10, 50, 0);
    fill(0, transp);
    noStroke();
    rect(sx-sombra, sy+sombra, sw, sh);
  }
}


String data_atual() {
  return(
    year()+
    "-"+
    nf(month(), 2, 0) +
    "-"+
    nf(day(), 2, 0)+
    "_"+
    nf(hour(), 2, 0)+
    "h"+
    nf(minute(), 2, 0)+
    "m"
    +nf(second(), 2, 0)+
    "s"
    );
}


boolean dentro_console() {
  if (mouseX > 10 && mouseX < width-10 && mouseY > height-60  && mouseY < height-10) {
    return true;
  } else {
    return false;
  }
}
