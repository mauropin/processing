void default_tampinhas() {
  ////////////////////////////////////////////////////////////////////////////////////////////

  /* CONFIGURAÇÃO PADRÃO DO NÚMERO DE TAMPINHAS POR LINHA (horizontal) e COLUNA (vertical) */

  ////////////////////////////////////////////////////////////////////////////////////////////

  //tampinhas na linha (largura / horizontal) - cabem 6 em 21 cm de largura
  num_x =  12  ;
  old_num_x = num_x;

  //tampinhas na coluna (altura / vertical) - cabem 10.5 em 29.7 cm de altura
  num_y =  10  ;
  old_num_y = num_y;

  if (orientacao.equals("horizontal")) {
    num_pagesA4_width = ceil(num_x/6.5);
    num_pagesA4_height = ceil(num_y/10.5);
  } else {
    num_pagesA4_width = ceil(num_x/7.0625);
    num_pagesA4_height = ceil(num_y/9.25);
  }
}
