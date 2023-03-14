//////// EXIBE CONSOLE COM QUANTIDADES DE TAMPINHAS //////
void console_info() {
  fill(30, 30, 10, 140);
  noStroke();
  rect(10, height-60, width-20, 50);
  if (show_paleta) {
    for (Paleta p : paletas) {
      p.display();
    }
    buttons[2].label = "i";
  }

  if (show_info) {
    fill(245);
    textFont(RobotoCond);
    textSize(14);
    textLeading(18);
    textAlign(LEFT);
    text(txt_console, 15, height-55, width-25, 50);
    buttons[2].label = "C";
  }

  for (Button b : buttons) {
    b.display();
  }
}
