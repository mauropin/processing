////////////////////// CONFIGURAÇÃO DO NÚMERO DE TAMPINHAS /////////////// //<>// //<>// //<>// //<>// //<>// //<>//
void input_dados() {

  if (key == ESC && novo) {
    key = 0; //altera a funcao do ESC quando estiver em pausa p/ digitacao de valores
    valores_x = "";
    valores_y = "";
    novo = false;
    num_x = old_num_x;
    num_y = old_num_y;
    reset(true, old_orientacao);
  }

  if (!escolhe_orientacao) {
    int k = int(key);
    if (escreve == 'x' && novo) {
      //escreve o texto na tela
      if (key == BACKSPACE) {
        if (valores_x.length() > 0) {
          valores_x = valores_x.substring(0, valores_x.length()-1);
          myText = valores_x;
        }
      } else if (k > 47 || k < 58) {
        valores_x = valores_x + key;
        myText = valores_x;
        if (valores_x.charAt(0) == 'n') { //retira o 'n' inicial - ultima tecla apertada que chamou a rotina
          valores_x = valores_x.substring(1, valores_x.length());
          myText = valores_x;
        }
      }

      if (key == ENTER  || key == RETURN) {
        //armazena os caracteres, retirando o ENTER final
        valores_x = valores_x.substring(0, valores_x.length()-1);

        //num_x = int(valores_x); //num_x nesse caso e' numero de bolinhas na vertical

        temp_num_pages_width = ceil(float(valores_x)/21);
        
        if(temp_num_pages_width < 1) temp_num_pages_width = 1;


        if (orientacao.equals("horizontal")) {
          num_x = floor((float(valores_x) * cm_to_px/diametro)*0.975);
        } else {
          num_x = ceil((float(valores_x) * cm_to_px/diametro)*1.025);
        }


        //if (orientacao.equals("horizontal")) {
        //  num_x = int(temp_num_pages_width * 6.5);
        //} else {
        //  num_x = int(temp_num_pages_width * 7.0625);
        //}

        //if (num_x == 0) {
        if (num_x == 0) {
          novo = true;
          escreve = 'x';
          valores_x = "";
          myText = "";
        } else {
          escreve = 'y';
          myText = "";
        }
      }
    } else if (escreve == 'y' && novo) {
      //escreve o texto na tela
      if (key == BACKSPACE) {
        if (valores_y.length() > 0) {
          valores_y = valores_y.substring(0, valores_y.length()-1);
          myText = valores_y;
        }
      }

      if (k > 47 || k < 58) {
        valores_y = valores_y + key;
        myText = valores_y;
      }

      if (key == ENTER  || key == RETURN) {

        //armazena os caracteres, retirando o ENTER final
        valores_y = valores_y.substring(0, valores_y.length()-1);

        //num_y = int(valores_y); //num_y e' nesse caso numero de bolinhas na vertical

        temp_num_pages_height = ceil(float(valores_y)/29.7);
        if(temp_num_pages_height < 1) temp_num_pages_height = 1;

        if (orientacao.equals("horizontal")) {
          num_y = ceil(float(valores_y) * cm_to_px /diametro*1.05);
        } else {
          num_y = floor(float(valores_y) * cm_to_px /diametro*0.975);
        }



        //if (orientacao.equals("horizontal")) {
        //  num_y = int(temp_num_pages_height * 10.5);
        //} else {
        //  num_y = int(temp_num_pages_height * 9.25);
        //}

        if (num_y == 0) {
          novo = true;
          valores_y = "";
          escreve = 'y';
          myText = "";
        } else {
          novo = false;
          old_orientacao = orientacao;
          num_pagesA4_width = temp_num_pages_width;
          num_pagesA4_height = temp_num_pages_height;
          reset(false, orientacao);
          old_num_x = num_x;
          old_num_y = num_y;
          escreve = ' ';
          myText = "";
          nome_pasta = data_atual();
        }
      }
    }
  }
}



//////// EXIBE PAINEL PARA INPUT Nº DE TAMPINHAS ////////
void desenha_input_tampinhas() {
  background(cor_fundo);
  imageMode(CORNER);
  image(header, 0, 0);
  fill(30, 30, 10);
  textFont(RobotoCondBold);
  textSize(52);
  noStroke();
  fill(30, 30, 10, 140);
  rect(0, 0, width, 425);
  fill(255);
  textAlign(CENTER);
  text("Mapa de Tampinhas", width/2, 200);

  fill(245);
  textFont(RobotoCond);
  textSize(20);
  textAlign(LEFT);


  PImage hz = loadImage("horizontal.png");
  PImage vt = loadImage("vertical.png");
  if (escolhe_orientacao) {
    textAlign(CENTER);
    imageMode(CENTER);
    text("escolha a orientação do desenho", width/2, 407);
    image(hz, 550, 525, hz.width*0.25, hz.height*0.25);
    image(vt, 725, 525, vt.width*0.25, hz.height*0.25);
    fill(130, 130, 100, 200);
    textSize(16);
    text("horizontal", 550, 625);
    text("vertical", 725, 625);
  } else {
    String sentido = "";
    if (escreve == 'x') {
      sentido = "HORIZONTAL";
    } else if (escreve == 'y') {
      sentido = "VERTICAL";
    }
    textAlign(LEFT);
    text("quantos centímetros na " + sentido +  ": " + myText + "_", width/2-200, 390, width/2-220, 80);
  }
}

void check_click_escolhe_orientacao() {
  if (mouseX > 490 && mouseX < 605 && mouseY > 445 && mouseY < 605) {
    orientacao = "horizontal";
    escolhe_orientacao = false;
  }
  if (mouseX > 665 && mouseX < 780 && mouseY > 445 && mouseY < 605) {
    orientacao = "vertical";
    escolhe_orientacao = false;
  }
}
