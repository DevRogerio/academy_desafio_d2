# academy_desafio_d2

import 'dart:collection';
import 'dart:math';

void main() {
  final filaMercado = FilaMercado();

  for (var i = 0; i < 10; i++) {
    final pessoa = Pessoa(NomeGenerator.gerarNomeAleatorio());
    filaMercado.entrarNaFila(pessoa);
  }

  filaMercado.atenderPessoas();
}

class FilaMercado {
  final Queue<Pessoa> _fila = Queue<Pessoa>();

  void entrarNaFila(Pessoa pessoa) {
    _fila.add(pessoa);
    print('${pessoa.nome} entrou na fila');
  }

  void atenderPessoas() {
    while (_fila.isNotEmpty) {
      final pessoaAtendida = _fila.removeFirst();
      print('${pessoaAtendida.nome} foi atendido(a)');
    }
  }
}

class Pessoa {
  final String nome;

  Pessoa(this.nome);
}

class NomeGenerator {
  static final Random _random = Random();
  static final List<String> _nomes = [
    'Rogerio',
    'Larissa',
    'Pedro',
    'Roberto',
    'Carlos',
    'Mariana',
    'José',
    'Fernanda',
    'Rafael',
    'Laura',
  ];
  static final List<String> _sobrenomes = [
    'Silva',
    'Santos',
    'Souza',
    'Pereira',
    'Oliveira',
    'Almeida',
    'Lima',
    'Costa',
    'Ferreira',
    'Gomes',
  ];

  static String gerarNomeAleatorio() {
    final nomeAleatorio = _nomes[_random.nextInt(_nomes.length)];
    final sobrenomeAleatorio = _sobrenomes[_random.nextInt(_sobrenomes.length)];
    return '$nomeAleatorio $sobrenomeAleatorio';
  }
}
