class MovimentoInvalidoException1 implements Exception {
  String errMsg() => 'Posição ocupada';
}

class MovimentoInvalidoException2 implements Exception {
  String errMsg() =>
      "A posição da linha e/ou coluna é inválida. Insira um valor entre 1 e 9";
}

class MovimentoInvalidoException3 implements Exception {
  String errMsg() =>
      "O valor que você tentou inserir é inválido. Favor inserir um outro valor, entre 1 e 9";
}

class MovimentoIncorretoException implements Exception {
  String errMsg() => "Jogada incorreta!";
}
