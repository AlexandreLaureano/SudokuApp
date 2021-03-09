import 'package:flutter/material.dart';
import 'package:sudoku_app/Global.dart';
import 'package:sudoku_app/Sudoku/Celula.dart';
import 'package:sudoku_app/Sudoku/DificudadePartida.dart';
import 'package:sudoku_app/Sudoku/Tabuleiro.dart';
import 'package:sudoku_app/Telas/GameOverPage.dart';
import 'package:sudoku_app/Widgets/Teclado.dart';
import 'package:sudoku_app/Widgets/TextCustom.dart';

class GridTabuleiro extends StatefulWidget {
  final Teclado tec;

  const GridTabuleiro({Key key, this.tec}) : super(key: key);

  @override
  _GridTabuleiroState createState() => _GridTabuleiroState();
}

class _GridTabuleiroState extends State<GridTabuleiro> {
  DificuldadePartida partida;
  List<List<int>> lista;
  int erros = 0;
  Tabuleiro t = new Tabuleiro();
  List<List<bool>> editavel =
      List.generate(9, (_) => List.generate(9, (_) => false));
  List<List<bool>> certo =
      List.generate(9, (_) => List.generate(9, (_) => false));
  List<List<Celula>> cel =
      List.generate(9, (_) => List.generate(9, (_) => Celula()));

  @override
  void initState() {
    partida = new DificuldadePartida(2, 5, 28);
    super.initState();
    t.geraTabuleiro(partida);
    t.tornarCasaVazias(partida);
    //t.grid;
    this.lista = t.getGrid();
    defineEditavel();
    print("Tabuleiro " + t.getGrid().toString());
    print("Tabuleiro " + t.getGabarito().toString());

    // print("tab " + t.getGabarito().toString());
  }

  void defineEditavel() {
    for (int x = 0; x < 9; x++) {
      for (int y = 0; y < 9; y++) {
        this.editavel[x][y] = this.lista[x][y] == 0 ? true : false;
        this.cel[x][y].editavel = this.lista[x][y] == 0 ? true : false;
      }
    }
  }

  TableCell _getCelula(int row, int col) {
    return TableCell(
      child: Container(
        height: (Global.getHeight(context) * 0.6) / 9,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              width: (col % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
            bottom: BorderSide(
              width: (row % 3 == 2) ? 3.0 : 1.0,
              color: Colors.black,
            ),
          ),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              if (this.cel[row][col].editavel) {
                print(widget.tec.numSelecionado.toString());
                print(widget.tec.toolSelec);
                if (widget.tec.toolSelec == 'pn') {
                  try {
                    setState(() {
                      t.executaMovimento(
                          row + 1, col + 1, widget.tec.numSelecionado);
                      this.cel[row][col].certo = true;
                    });
                  } catch (ex) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(ex.errMsg())));
                    erros++;
                    if (erros > partida.qtMaxErros) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GameOverPage()));
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Game Over')));
                    }
                  } finally {
                    if (t.isTabuleiroPreenchido()) {
                      if (t.isEqual()) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text("Concluido")));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Concluido com erro")));
                      }
                    }
                  }

                  //this.lista[row][col] = widget.tec.numSelecionado;
                } else if (widget.tec.toolSelec == 'er') {
                  setState(() {
                    this.lista[row][col] = 0;
                    this.cel[row][col].certo = false;
                  });
                }
              }
            },
            child: TextCustom(
              texto: lista[row][col] == 0 ? '' : lista[row][col].toString(),
              editavel: this.cel[row][col].editavel,
              certo: this.cel[row][col].certo,
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _getLinha(int row) {
    return List.generate(9, (int col) {
      return _getCelula(row, col);
    });
  }

  List<TableRow> _getTableRows() {
    return List.generate(9, (int rowNumber) {
      return TableRow(children: _getLinha(rowNumber));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Table(
                border: TableBorder(
                  left: BorderSide(width: 3.0, color: Colors.black),
                  top: BorderSide(width: 3.0, color: Colors.black),
                ),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                children: _getTableRows())));
  }
}
