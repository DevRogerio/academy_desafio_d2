# academy_desafio_d2

void main() {
  final baralho = Baralho();

  baralho.empilharCarta(Carta(Naipe.paus, 'A ♣'));
  baralho.empilharCarta(Carta(Naipe.copas, 'A ♥'));
  baralho.empilharCarta(Carta(Naipe.espadas, 'A ♠'));
  baralho.empilharCarta(Carta(Naipe.ouros, 'A ♦'));

  final tamanhoBaralho = baralho.tamanho;
  for (var i = 0; i < tamanhoBaralho; i++) {
    final cartaRemovida = baralho.removerCarta();
    print('Carta removida: ${cartaRemovida.valor}');
  }
}

class Baralho {
  final Queue<Carta> cartas = Queue<Carta>();

  void empilharCarta(Carta carta) {
    cartas.add(carta);
  }

  Carta removerCarta() {
    final cartaRemovida = cartas.removeFirst();
    return cartaRemovida;
  }

  int get tamanho => cartas.length;
}

class Carta {
  final Naipe naipe;
  final String valor;

  Carta(this.naipe, this.valor);
}

enum Naipe { paus, copas, espadas, ouros }
