///////////// JANELA COM PREVIEW DO DESENHO ////////////
void cria_preview() {
  //float d = diametro_visualizacao/escala*0.9;
  float d = diametro_visualizacao/escala;
  int i = 0;
  float r = d/2;
  float offset_x = r;
  float offset_y = r;
  int linha = 0;
  float y, x;
  preview.beginDraw();
  preview.background(cor_fundo);

  if (orientacao.equals("horizontal")) {
    for (int ny = 0; ny < num_y; ny++) {
      for (int nx = 0; nx < num_x; nx++) {
        if (linha%2 == 0) {
          offset_x = r;
        } else {
          offset_x = d;
        }
        x = nx*d*1.025+offset_x;
        y = ny*d*0.9+r;
        if (balls[i].ink == 0) {
          preview.stroke(234, 234, 213);
          preview.strokeWeight(1.5);
          preview.noFill();
        } else {
          preview.noStroke();
          preview.fill(cores[balls[i].ink]);
        }
        preview.circle(x*escala, y*escala, d*escala);
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
          offset_y = d;
        }
        x = nx*d*0.9+r;
        y = ny*d*1.025+offset_y;
        if (balls[i].ink == 0) {
          preview.stroke(234, 234, 213);
          preview.strokeWeight(1.5);
          preview.noFill();
        } else {
          preview.noStroke();
          preview.fill(cores[balls[i].ink]);
        }
        preview.circle(x*escala, y*escala, d*escala);
        i++;
      }
      linha++;
    }
  
  }
  preview.endDraw();
}
