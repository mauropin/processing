
/////// SALVA PAGINAS EM PDF ////////

void saveFiles() {
  count_colors(false);
  show_console = true;
  show_paleta = false;
  show_info = true;

  saveCSV();
  println(data_atual() + " : tabela CSV salva");

  exportSinglePDF(true);
  println(data_atual() + " : página com o desenho completo salva");

  exportSinglePDF(false);
  println(data_atual() + " : página com o mapa completo salva");

  exportPagesPDF(true);
  println(data_atual() + " : páginas do desenho salvas");

  exportPagesPDF(false);
  println(data_atual() + " : páginas com mapa de cores salvas");

  count_colors(true);
  println("desenho atual salvo / PDFs criados");
}



void exportPagesPDF(boolean printCor) {
  cursor(WAIT);
  PGraphics page;
  String complemento = "";
  if (printCor) {
    complemento = "_cores";
  } else {
    complemento = "_nomes";
  }
  int pageCount = 1;
  int posX = 0;
  int posY = 0;
  int moveX = int(width_A4);
  int moveY = int(height_A4);

  for (int pagesY = 0; pagesY < num_pagesA4_height; pagesY++) {
    for (int pagesX = 0; pagesX < num_pagesA4_width; pagesX++) {
      page = createGraphics(int(width_A4), int(height_A4), PDF, "salvos/" + nome_pasta + "/padrao_pagina_"+ "X" + nf(pagesX+1) + "Y" + nf(pagesY+1) + "_"+ complemento + ".pdf");
      page.beginDraw();
      page.background(255);
      page.strokeWeight(2);
      page.pushMatrix();
      page.translate(posX, posY);
      int i = 0;
      float r = diametro/2;
      float offset_x = r;
      float offset_y = r;
      int linha = 0;

      float y, x;

      //preenche as bolinhas da pagina
      if (orientacao.equals("horizontal")) {

        for (int ny = 0; ny < num_y; ny++) {
          for (int nx = 0; nx < num_x; nx++) {
            if (linha%2 == 0) {
              offset_x = r;
            } else {
              offset_x = diametro;
            }
            
            x = (num_pagesA4_width * width_A4) - (nx*diametro*1.025+offset_x); //espelhado
            // x = nx*diametro*1.025+offset_x; //normal
            y = ny*diametro*0.9+r;
            page.stroke(140);
            if (balls[i].ink != 0) {
              if (!printCor) {
                page.fill(140);
                page.textAlign(CENTER, CENTER);
                page.textSize(14);
                page.text(cor_nome[balls[i].ink], x, y);
              } else {
                page.fill(cores[balls[i].ink]);
                if (balls[i].ink == 8) page.stroke(0);
                page.circle(x, y, diametro);
              }
            }
            page.noFill();
            page.circle(x, y, diametro);
            i++;
          }
          linha++;
        }
      } else {

        for (int nx = 0; nx < num_x; nx++) { //normal
          //for (int nx = num_x; nx > 0; nx--) {  //espelhado
          for (int ny = 0; ny < num_y; ny++) {
            if (linha%2 == 0) {
              offset_y = r;
            } else {
              offset_y = diametro;
            }
            y = ny*diametro*1.025+offset_y;
            x = (num_pagesA4_width * width_A4) - (nx*diametro*0.9+r); //espelhado
            //x = nx*diametro*0.9+r;
            page.stroke(140);
            if (balls[i].ink != 0) {
              if (!printCor) {
                page.fill(140);
                page.textAlign(CENTER, CENTER);
                page.textSize(14);
                page.text(cor_nome[balls[i].ink], x, y);
              } else {
                page.fill(cores[balls[i].ink]);
                if (balls[i].ink == 8) page.stroke(0);
                page.circle(x, y, diametro);
              }
            }
            page.noFill();
            page.circle(x, y, diametro);
            i++;
          }
          linha++;
        }
      }


      ///grid
      float width_A4 = 595;
      float height_A4 = 841;
      page.stroke(100);
      page.noFill();
      page.rectMode(CORNER);
      for (int numPagesY = 0; numPagesY < num_pagesA4_height; numPagesY++) {
        for (int numPagesX = 0; numPagesX < num_pagesA4_width; numPagesX++) {
          float px = width_A4 * numPagesX;
          float py = height_A4 * numPagesY;
          page.rect(px, py, width_A4, height_A4);
        }
      }


      page.dispose();
      page.endDraw();
      page.popMatrix();
      posX -= moveX;

      pageCount++;
    }
    posY -= moveY;
    posX = 0;
  }
  count_colors(false);
  cursor(ARROW);
}


//////////  SALVA O DESENHO INTEIRO EM UMA UNICA PAGINA PDF ////////
void exportSinglePDF(boolean printCor) {
  cursor(WAIT);
  String complemento = "";
  if (printCor) {
    complemento = "_cores";
  } else {
    complemento = "_nomes";
  }

  //PGraphics pdf = createGraphics(int(num_x * diametro*1.05), int(num_y * diametro * 0.905), PDF, "PDF/padrao_"+data_atual()+".pdf");
  PGraphics pdf = createGraphics(int(num_pagesA4_width * width_A4), int(num_pagesA4_height * height_A4), PDF, "salvos/" + nome_pasta + "/padrao_"+ complemento + ".pdf");
  pdf.beginDraw();
  pdf.background(255);
  pdf.strokeWeight(2);

  int i = 0;
  float r = diametro/2;
  float offset_x = r;
  float offset_y = r;
  int linha = 0;

  float y, x;

  if (orientacao.equals("horizontal")) {
    for (int ny = 0; ny < num_y; ny++) {
      for (int nx = 0; nx < num_x; nx++) {
        if (linha%2 == 0) {
          offset_x = r;
        } else {
          offset_x = diametro;
        }
        x = nx*diametro*1.025+offset_x;
        y = ny*diametro*0.9+r;
        pdf.stroke(140);
        if (balls[i].ink != 0) {
          if (!printCor) {
            pdf.fill(140);
            pdf.textAlign(CENTER, CENTER);
            pdf.textSize(14);
            pdf.text(cor_nome[balls[i].ink], x, y);
          } else {
            pdf.fill(cores[balls[i].ink]);
            if (balls[i].ink == 8) pdf.stroke(0);
            pdf.circle(x, y, diametro);
          }
        }
        pdf.noFill();
        pdf.circle(x, y, diametro);
        i++;
      }
      linha++;
    }
  } else {
    for (int nx = 0; nx < num_x; nx++) {
      for (int ny = 0; ny < num_y; ny++) {
        if (linha%2 == 0) {
          offset_y = r;
        } else {
          offset_y = diametro;
        }
        x = nx*diametro*0.9+r;
        y = ny*diametro*1.025+offset_y;
        pdf.stroke(140);
        if (balls[i].ink != 0) {
          if (!printCor) {
            pdf.fill(140);
            pdf.textAlign(CENTER, CENTER);
            pdf.textSize(14);
            pdf.text(cor_nome[balls[i].ink], x, y);
          } else {
            pdf.fill(cores[balls[i].ink]);
            if (balls[i].ink == 8) pdf.stroke(0);
            pdf.circle(x, y, diametro);
          }
        }
        pdf.noFill();
        pdf.circle(x, y, diametro);
        i++;
      }
      linha++;
    }
  }

  pdf.dispose();
  pdf.endDraw();
  count_colors(false);
  cursor(ARROW);
}




////////// SALVA INFOS DO DESENHO EM ARQUIVO CSV ////////////
void saveCSV() {
  cursor(WAIT);
  csvFile = createWriter("tampinhas.csv");
  int i = 0;
  float r = diametro/2;
  float offset_x = r;
  float offset_y = r;
  int linha = 0;

  float y, x;

  csvFile.println("index,x,y,cor_nome,cor_codigo,num_x,num_y,orientacao");

  if (orientacao.equals("horizontal")) {

    for (int ny = 0; ny < num_y; ny++) {
      for (int nx = 0; nx < num_x; nx++) {
        if (linha%2 == 0) {
          offset_x = r;
        } else {
          offset_x = diametro;
        }
        x = nx*diametro*1.025+offset_x;
        y = ny*diametro*0.9+r+14.1732;
        csvFile.println(i + "," + x + "," + y + "," + cor_nome[balls[i].ink] + "," + balls[i].ink + "," + num_x + "," + num_y + "," + orientacao);
        i++;
      }
      linha++;
    }
  } else {

    for (int nx = 0; nx < num_x; nx++) {
      for (int ny = 0; ny < num_y; ny++) {
        if (linha%2 == 0) {
          offset_y = r;
        } else {
          offset_y = diametro;
        }
        x = nx*diametro*0.9+r;
        y = ny*diametro*1.025+offset_y;
        csvFile.println(i + "," + x + "," + y + "," + cor_nome[balls[i].ink] + "," + balls[i].ink + "," + num_x + "," + num_y + "," + orientacao);
        i++;
      }
      linha++;
    }
  }

  csvFile.flush();
  csvFile.close();

  Table backup = loadTable("tampinhas.csv", "header");

  saveTable(backup, "salvos/" + nome_pasta + "/tampinhas.csv");
  cursor(ARROW);
}
