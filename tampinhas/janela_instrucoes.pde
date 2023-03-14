///////// INSTRUCOES /////////
void mostra_instrucoes() {
  float line_x, line_y;
  String instrucoes = "";
  float maior_linha = 0;
  float altura;
  //sombra(up_corner_x-30, up_corner_y-30, 700, 710);
  sombra(250, 10, width-500, height-20);
  fill(255);
  rect(250, 10, width-500, height-20);
  fill(0);
  textFont(RobotoCondBold);
  textAlign(CENTER);
  textSize(16);
  //text("COMO USAR", up_corner_x+650/2, up_corner_y);
  text("COMO USAR", width/2, 40);
  textFont(RobotoCond);
  textSize(13.5);
  textLeading(15);
  for (int l = 5; l < txt_help.length; l++) {
    maior_linha = textWidth(txt_help[l]);
    instrucoes = instrucoes + txt_help[l] + "\n";
  }
  altura = txt_help.length *19;
  float up_corner_y = (height - altura)-30;
  float up_corner_x = (width - maior_linha)/3;
  textAlign(LEFT);
  //text(instrucoes, up_corner_x, up_corner_y+16, 650, 700);
  text(instrucoes, 280, 50, 730, 900);

}
