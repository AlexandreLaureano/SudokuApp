import 'package:sudoku_app/Sudoku/DificudadePartida.dart';
import 'package:sudoku_app/Sudoku/Tabuleiro.dart';

class Partida {
  //Jogador jogador;
  Tabuleiro tabuleiro;
  int qtErros;
  bool venceu;
  DateTime tempo;
  int score;
  DificuldadePartida dificuldade;

  Partida(Tabuleiro tabuleiro, int qtErros, bool venceu, DateTime tempo,
      DificuldadePartida dificuldade) {
    this.tabuleiro = tabuleiro;
    this.qtErros = qtErros;
    this.venceu = venceu;
    this.tempo = tempo;
    this.dificuldade = dificuldade;
  }

  void executaMovimento(int linha, int coluna, int valor) {
    try {
      if (tabuleiro.executaMovimento(linha, coluna, valor) == true)
        venceu = tabuleiro.isTabuleiroPreenchido();
    } catch (e) {
      this.qtErros += 1;
      print("Quantidade de erros = " + this.qtErros.toString());
      throw e.errMsg;
    }
  }

  bool isFimdeJogo() {
    if (this.qtErros == dificuldade.getQtMaxErros())
      return true;
    else
      return false;
  }

  void iniciaPartida() {
    this.qtErros = 0;
    this.tempo = new DateTime.now();
    this.venceu = false;
    this.tabuleiro.geraTabuleiro(dificuldade);
  }

  /*Jogador getJogador(){
    return jogador
  }
  void setJogador(Jogador jogador){
    this.jogador = jogador;
  }
  */

  Tabuleiro getTabuleiro() {
    return tabuleiro;
  }

  void setTabuleiro(Tabuleiro tabuleiro) {
    this.tabuleiro = tabuleiro;
  }

  int getQuantidadeErros() {
    return qtErros;
  }

  void setQuantidadeErros(int quantidadeErros) {
    this.qtErros = quantidadeErros;
  }

  bool isVenceu() {
    return venceu;
  }

  void setVenceu(bool venceu) {
    this.venceu = venceu;
  }

  DateTime getTempo() {
    return tempo;
  }

  void setTempo(DateTime tempo) {
    this.tempo = tempo;
  }

  int getScore() {
    return score;
  }

  void setScore(int score) {
    this.score = score;
  }

  DificuldadePartida getDificuldade() {
    return dificuldade;
  }

  void setDificuldade(DificuldadePartida dificuldade) {
    this.dificuldade = dificuldade;
  }
}
