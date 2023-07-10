# academy_desafio_d2

import 'dart:math';
import 'dart:async';

class Figura {
  String nome;
  int codigo;

  Figura(this.nome, this.codigo);
}

class PacoteFiguras {
  List<Figura> figuras;

  PacoteFiguras(this.figuras);
}

class AlbumFigurinhas {
  List<Figura> album = [];
  List<int> repetidas = [];

  void adicionarFiguras(PacoteFiguras pacote) {
    pacote.figuras.forEach((figura) {
      album.contains(figura) ? repetidas.add(figura.codigo) : album.add(figura);
    });
  }

  bool albumCompleto(List<Figura> listaFiguras) => listaFiguras.every(album.contains);

  Future<void> imprimirAlbum() async {
    album.sort((a, b) => a.codigo.compareTo(b.codigo));
    for (var figura in album) {
      print('${figura.codigo}: ${figura.nome}');
      await Future.delayed(Duration(seconds: 1));
    }
  }
}

void main() async {
  var listaFiguras = List<Figura>.generate(20, (i) => Figura(['Goku', 'Vegeta', 'Gohan', 'Piccolo', 'Trunks', 'Goten', 'Bulma', 'Krillin', 'Yamcha', 'Tien', 'Chiaotzu', 'Android 18', 'Frieza', 'Cell', 'Majin Buu', 'Beerus', 'Whis', 'Broly', 'Jiren', 'Hit'][i], i + 1));
  var random = Random();
  var albumDragonBall = AlbumFigurinhas();
  var pacoteFiguras = PacoteFiguras([]);

  do {
    var figurasAleatorias = List<Figura>.generate(4, (_) => listaFiguras[random.nextInt(listaFiguras.length)]);
    pacoteFiguras.figuras = figurasAleatorias;
    albumDragonBall.adicionarFiguras(pacoteFiguras);
  } while (!albumDragonBall.albumCompleto(listaFiguras));

  print("-------------ALBUM DE FIGURINHAS DO DRAGON BALL----------------");
  print('Número de figuras repetidas: ${albumDragonBall.repetidas.length}');
  await albumDragonBall.imprimirAlbum();
