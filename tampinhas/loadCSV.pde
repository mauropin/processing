////////// CARREGA INFOS DO DESENHO DO CSV ARQUIVADO ////////////
void loadCSV() {
  Table table;
  table = loadTable("tampinhas.csv", "header");
  int total_balls = table.getRowCount();
  balls = new Ball[total_balls];
  String tmp_orientacao = orientacao;

  for (TableRow row : table.rows()) {
    int index = row.getInt("index");
    float x = row.getFloat("x");
    float y = row.getFloat("y");
    int cor_codigo = row.getInt("cor_codigo");
    tmp_orientacao  = row.getString("orientacao");
    num_x = row.getInt("num_x");
    num_y = row.getInt("num_y");
    balls[index] = new Ball(x, y, diametro, cor_codigo);
  }
  old_num_x = num_x;
  old_num_y = num_y;
  if (orientacao.equals("horizontal")) {
    num_pagesA4_width = ceil(num_x/6.5);
    num_pagesA4_height = ceil(num_y/10.5);
  } else {
    num_pagesA4_width = ceil(num_x/7.0625);
    num_pagesA4_height = ceil(num_y/9.25);
  }
  reset(true, tmp_orientacao);
}
