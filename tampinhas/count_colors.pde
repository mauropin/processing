//////// CONTABILIZA TAMPINHAS /////////
void count_colors(boolean prt) {

  String div;
  if (prt) {
    div = "\n";
  } else {
    div = " / ";
  }

  int [] total_cor = new int[cores.length];
  int todas_cores = 0;
  for (Ball b : balls) {
    int ink = b.ink;
    for (int i = 1; i < cores.length; i++) {
      if (ink == i) {
        total_cor[i]++;
        todas_cores++;
      }
    }
  }

  txt_console = "grid de " + num_x + " por " + num_y + " tampinhas" + div + balls.length + " posições" + div + "total de páginas A4 usadas: " + num_pagesA4_width*num_pagesA4_height + div +  "total de tampinhas usadas: " + todas_cores + "\n";
  for (int i = 1; i < total_cor.length; i++) {
    // println(cor_nome[i]+": "+total_cor[i]);
    txt_console = txt_console + "("+ i + ") " + (cor_nome[i]+ ": " +total_cor[i]);
    if (i != total_cor.length-1 ) txt_console = txt_console + div;
  }


  if (prt) {
    println(data_atual());
    println(txt_console);
    csvFile = createWriter("salvos/" + nome_pasta + "/quantas_tampinhas.txt");
    csvFile.println(data_atual());
    csvFile.println(txt_console);
    csvFile.flush();
    csvFile.close();
  }
}
