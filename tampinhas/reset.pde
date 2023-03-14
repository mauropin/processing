void reset(boolean carregando, String nova_orientacao) {
  edicao = true;
  escala = 1;


  diametro_visualizacao = ceil(min((width/num_x), (height/num_y)));

  diametro_cursor = diametro;

  if (!carregando) {
    balls = new Ball[num_x*num_y];
    populateArray();
  }

  //reinicia posicao do desenho na tela
  primeCornerX = 0;
  primeCornerY = 0;
  orientacao = nova_orientacao;
  old_orientacao = orientacao;
  reset_balls_position();


  if (orientacao.equals("horizontal")) {
    preview = createGraphics(int(num_x * diametro_visualizacao*1.25), int(num_y * diametro_visualizacao * 0.95));
  } else {
    preview = createGraphics(int(num_x * diametro_visualizacao*0.95), int(num_y * diametro_visualizacao * 1.25));
  }
}
