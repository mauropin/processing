//////////// CRIA AS TAMPINHAS ////////////
void populateArray() {
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
        balls[i] = new Ball(x, y, diametro, 0);
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
        y = ny*diametro*1.025+offset_y;
        x = nx*diametro*0.9+r;
        balls[i] = new Ball(x, y, diametro, 0);
        i++;
      }
      linha++;
    }
  }
}


void reset_balls_position() {
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
        balls[i].x = x;
        balls[i].y = y;
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
        y = ny*diametro*1.025+offset_y;
        x = nx*diametro*0.9+r;
        balls[i].x = x;
        balls[i].y = y;
        i++;
      }
      linha++;
    }
  }
}
