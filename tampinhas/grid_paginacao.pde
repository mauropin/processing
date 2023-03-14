/////////  EXIBE MARCACAO DA DIVISAO DA PAGINA /////////
void grid() {
  strokeWeight(1.5);
  stroke(100);
  noFill();
  rectMode(CORNER);
  pushMatrix();
  scale(escala);
  for (int numPagesY = 0; numPagesY < num_pagesA4_height; numPagesY++) {
    for (int numPagesX = 0; numPagesX < num_pagesA4_width; numPagesX++) {
      float px = primeCornerX +  width_A4 * numPagesX;
      float py = primeCornerY + height_A4 * numPagesY;
      rect(px, py, width_A4, height_A4);
    }
  }
  popMatrix();
}
