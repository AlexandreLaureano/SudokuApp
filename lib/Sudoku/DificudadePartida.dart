class DificuldadePartida {
  //FACIL(1,10,24), NORMAL(2,5,28), DIFICIL(3,3,32);

  int valor;
  int qtMaxErros;
  int qtEspacosVazios;

  DificuldadePartida(int valor, int qtMaxErros, int qtEspacosVazios) {
    this.valor = valor;
    this.qtMaxErros = qtMaxErros;
    this.qtEspacosVazios = qtEspacosVazios;
  }

  int getValor() {
    return this.valor;
  }

  int getQtMaxErros() {
    return this.qtMaxErros;
  }

  int getQtEspacosVazios() {
    return this.qtEspacosVazios;
  }
}
