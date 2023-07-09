# academy_desafio_d2

void main() {
  final biblioteca = BibliotecaDeMusicas([
    Musica('Boate Azul', 'Cristiano Araújo', 'In The Cities', 223),
    Musica('Majestade O Sabiá', 'Roberta Miranda', 'Um Rosto de Mulher', 289),
    Musica('Evidências', 'Chitãozinho & Xororó', 'Cowboy do Asfalto', 256),
    Musica('Romaria', 'Renato Teixeira', 'Romaria', 293),
    Musica('Fio de Cabelo', 'Chitãozinho & Xororó', '60 Dias Apaixonado', 221),
  ]);

  biblioteca.imprimirMusicas();

  print('Número de músicas: ${biblioteca.numeroDeMusicas}');
  print('Tempo total em horas: ${biblioteca.tempoTotalEmHoras}');

  biblioteca.pesquisarPorTitulo('Evidências');
  biblioteca.pesquisarPorArtista('Chitãozinho');
  biblioteca.pesquisarPorAlbum('In The Cities');
}

class Musica {
  final String titulo;
  final String artista;
  final String album;
  final int duracao;

  Musica(this.titulo, this.artista, this.album, this.duracao);

  @override
  String toString() =>
      'Título: $titulo | Artista: $artista | Álbum: $album | Duração: ${duracao}s';
}

class BibliotecaDeMusicas {
  final List<Musica> musicas;

  BibliotecaDeMusicas(this.musicas);

  void imprimirMusicas() {
    print('- Biblioteca de Músicas -');
    musicas.asMap().forEach((index, musica) {
      print('Música ${index + 1}:');
      print(musica);
      print('----------------');
    });
  }

  int get numeroDeMusicas => musicas.length;

  double get tempoTotalEmHoras =>
      musicas.map((musica) => musica.duracao).reduce((a, b) => a + b) / 3600;

  void pesquisarPorTitulo(String titulo) {
    final musicasEncontradas = musicas.where(
        (musica) => musica.titulo.toLowerCase().contains(titulo.toLowerCase()));
    print('---- Músicas encontradas por título ----');
    musicasEncontradas.forEach(print);
  }

  void pesquisarPorArtista(String artista) {
    final musicasEncontradas = musicas.where((musica) =>
        musica.artista.toLowerCase().contains(artista.toLowerCase()));
    print('---- Músicas encontradas por artista ----');
    musicasEncontradas.forEach(print);
  }

  void pesquisarPorAlbum(String album) {
    final musicasEncontradas = musicas.where(
        (musica) => musica.album.toLowerCase().contains(album.toLowerCase()));
    print('---- Músicas encontradas por álbum ----');
    musicasEncontradas.forEach(print);
  }
}
