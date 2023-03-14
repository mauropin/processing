/////////////   BALL CLASS   ///////////////
class Ball {
  float x, y, diam;
  int ink;

  Ball(float x, float y, float diam, int ink) {
    this.x = x;
    this.y = y;
    this.diam = diam;
    this.ink = ink;
  }

  void display() {
    if (ink == 0) {
      noFill();
      stroke(234, 234, 213);
    } else {
      fill(cores[ink]);
      noStroke();
    }
    circle(x*escala, y*escala, diam*escala);
  }

  void paint() {
    if (mousePressed) {

      if (!show_console || !dentro_console()) {
        float d = dist(mouseX/escala, mouseY/escala, x, y);
        if (d*escala < diametro_cursor/2 && !scrolling && edicao && !show_help) {
          ink = current_ink;
        }
      }
    }
  }
}

/////////// PALETA CLASS /////////

class Paleta {
  float x, y, diam;
  color c;
  int palete_index;

  Paleta(float x, float y, float diam, color c, int palete_index) {
    this.x = x;
    this.y = y;
    this.diam = diam;
    this.c = c;
    this.palete_index = palete_index;
  }

  void display() {
    fill(c);
    if (palete_index == 0) {
      stroke(140);
      pushMatrix();
      translate(x, y);
      rotate(radians(45));
      circle(0, 0, diam);
      line(0-diam/2, 0, 0+diam/2, 0);
      popMatrix();
    } else {
      noStroke();
      circle(x, y, diam);
      textFont(RobotoCondBold);
      textAlign(CENTER, CENTER);
      textSize(20);
      fill(120);
      noStroke();
      text(nf(palete_index), x-13, y-15, 25, 25);
    }
  }

  void escolhe_cor() {
    current_ink = palete_index;
  }

  boolean checkClick() {
    float d = dist(mouseX, mouseY, x, y);
    if (d < diam/2 && !dragging && !scrolling) {
      return true;
    }
     else;
    {
      return false;
    }
  }
}


class Button {
  float x, y, diam;
  int button_index;
  String label;

  Button(float x, float y, float diam, int button_index, String label) {
    this.x = x;
    this.y = y;
    this.diam = diam;
    this.button_index = button_index;
    this.label = label;
  }

  void display() {
    stroke(cor_fundo);
    noFill();
    strokeWeight(2);
    circle(x, y, diam);
    textFont(RobotoCondBold);
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(cor_fundo);
    noStroke();
    text(label, x-13, y-15, 25, 25);
  }

  void clique() {
    if (label.equals("–") && escala > 0.01 && edicao) escala *= 0.9;
    if (label.equals("+") && escala > 0.01 && edicao) {
      escala *= 1.1;
      if (diametro_cursor < diametro*escala) diametro_cursor = diametro*escala;
    }
    if (label.equals("i") || label.equals("C")) {
      show_info = !show_info;
      show_paleta = !show_paleta;
      show_help = false;
    }
    if (label.equals("?")) {
      show_help = !show_help;
    }
  }

  boolean checkClick() {
    float d = dist(mouseX, mouseY, x, y);
    if (d < diam/2 && !dragging && !scrolling) {
      return true;
    }
     else;
    {
      return false;
    }
  }
}
