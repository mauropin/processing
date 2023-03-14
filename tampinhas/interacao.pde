
///////// INTERACAO ///////////
void keyPressed() {

  int k = (int(key));

  if (novo && ((k !=127 && k !=65535)  && ((k > 47 && k < 59) || key == ENTER || key == RETURN || k == 13 || k == 8 || k == 27)) ) input_dados();


  if (!novo) {
    if (key == 'n' || key == 'N') {
      novo = true;
      escolhe_orientacao = true;
      escreve = 'x';
      myText = "";
      valores_x = "";
      valores_y = "";
      input_dados();
    }

    if (key == '1') current_ink = 1;
    if (key == '2') current_ink = 2;
    if (key == '3') current_ink = 3;
    if (key == '4') current_ink = 4;
    if (key == '5') current_ink = 5;
    if (key == '6') current_ink = 6;
    if (key == '7') current_ink = 7;
    if (key == '8') current_ink = 8;
    if (key == '9') current_ink = 9;


    if (keyCode == UP && edicao) {
      escala *= 1.1;
      if (diametro_cursor < diametro*escala) diametro_cursor = diametro*escala;
    }
    if (keyCode == DOWN && escala > 0.01 && edicao) escala *= 0.9;

    if (keyCode == RIGHT && edicao) {
      escala_foto *= 1.1;
    }
    if (keyCode == LEFT && escala_foto > 0.01 && edicao) escala_foto *= 0.9;



    if (key =='a'  || key == 'A') {
      for (Ball b : balls) {
        b.ink = current_ink;
      }
    }
    //if (key == ENTER || key == RETURN) count_colors(true);
    if (key == 'c' || key == 'C') {
      show_console = true;
      show_info = false;
      show_paleta = true;
      show_help = false;
    }
    if (key == 'p' || key == 'P') exportPagesPDF(true);
    if (key == 'o' || key == 'O') exportPagesPDF(false);
    if (key == 't' || key == 'T') exportSinglePDF(true);
    if (key == 'e' || key == 'E') saveCSV();
    if (key == 'f' || key == 'F') foto_fundo = !foto_fundo;
    if (key == 'l' || key == 'L') loadCSV();
    if (key == 'h' || key == 'H') show_help = !show_help;
    if (key == 'i' || key == 'I') {
      show_info = !show_info;
      show_paleta = !show_paleta;
      show_console = true;
    }
    if (key == 'v' || key == 'V') show_viewer = !show_viewer;
    if (key == 'z' || key == 'Z') edicao = !edicao;
    if (key == BACKSPACE) current_ink = 0; //DELETE no Mac
    if (key == DELETE) reset(false, orientacao); //FN+DELETE no Mac
    if (key == 's' || key == 'S') saveFiles();
    if (key == 'Q') {
      saveFiles();
      exit();
    }
    if (key == ' ' && edicao) scrolling = true;
  }
}



void keyReleased() {
  scrolling = false;
}


void mouseDragged() {
  if (scrolling) {
    for (Ball b : balls) b.x+= mouseX-pmouseX;
    for (Ball b : balls) b.y+= mouseY-pmouseY;
    primeCornerX = int(balls[0].x - balls[0].diam/2);
    primeCornerY = int(balls[0].y - balls[0].diam/2);
  } else {
    dragging = true;
  }
}

void mouseReleased() {
  dragging = false;
}


void mousePressed() {
  for (Button b : buttons) {
    if (b.checkClick()) b.clique();
  }

  for (Paleta p : paletas) {
    if (p.checkClick()) p.escolhe_cor();
  }

  if (novo) check_click_escolhe_orientacao();
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e < 0 && diametro_cursor > diametro*escala) diametro_cursor *= 0.9;
  if (e > 0) diametro_cursor *= 1.1;
}
