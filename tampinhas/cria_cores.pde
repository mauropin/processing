
////// CARREGA CORES ///////
void cria_cores() {
  cores = new color[10];
  cor_nome = new String[cores.length];

  cores[0] = color(cor_fundo);
  cor_nome[0] = "X";

  cores[1] = color(170, 0, 0);
  cor_nome[1] = "vermelho";

  cores[2] = color(247, 150, 0);
  cor_nome[2] = "laranja";

  cores[3] = color(247, 215, 0);
  cor_nome[3] = "amarelo";

  cores[4] = color(0, 120, 0);
  cor_nome[4] = "verde";

  cores[5] = color(20, 165, 185);
  cor_nome[5] = "acqua";

  cores[6] = color(10, 40, 170);
  cor_nome[6] = "azul";

  cores[7] = color(100, 0, 195);
  cor_nome[7] = "roxo";

  cores[8] = color(255);
  cor_nome[8] = "branco";

  cores[9] = color(0);
  cor_nome[9] = "preto";
  
  paletas = new Paleta[cores.length];

  float palete_x = 40;
  float palete_y = height-35;
  float palete_d = 25;
  for(int p = 0; p < paletas.length; p++){
    paletas[p] = new Paleta(palete_x, palete_y, palete_d, cores[p], p);
    palete_x += 50;
  }
}


//////// botoes ////////
void cria_botoes(){
  String [] labels = {"–", "+", "i", "?"};
  buttons = new Button[labels.length];
  int posX = width-buttons.length*50; 
  for(int i = 0; i < buttons.length; i++){
    buttons[i] = new Button(posX, height-35, 25, i, labels[i]);
    posX += 50;
  }
}
