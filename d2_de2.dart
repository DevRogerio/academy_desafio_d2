# academy_desafio_d2

  void main() {
  final pessoa = Pessoa();

  print("Calorias iniciais: ${pessoa.caloriasConsumidas}");
  int numeroRefeicoes = 0;

  final fornecedores = <Fornecedor>[
    FornecedorUltraCaloricos(),
    FornecedorDoces(),
    FornecedorComidas(),
    FornecedorDeBebidas(),
  ];

  while (pessoa.caloriasConsumidas < 2500) {
    numeroRefeicoes++;

    pessoa.refeicao(fornecedores[random.nextInt(fornecedores.length)]);
  }

  pessoa.informacoes(numeroRefeicoes);
}

class Pessoa {
  num caloriasConsumidas = random.nextInt(1700) + 300;
  late String statusCaloria;

  void informacoes(int numeroRefeicoes) {
    print('Calorias consumidas: $caloriasConsumidas');
    print('Status: $statusCaloria');
    print("Número de refeições: $numeroRefeicoes");
  }

  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    caloriasConsumidas += produto.calorias;
    atualizarStatusCaloria();
  }

  void atualizarStatusCaloria() {
    if (caloriasConsumidas <= 500) {
      statusCaloria = StatusCaloria.DeficitExtremo.toString();
    } else if (caloriasConsumidas <= 1800) {
      statusCaloria = StatusCaloria.Deficit.toString();
    } else if (caloriasConsumidas <= 2500) {
      statusCaloria = StatusCaloria.Satisfeito.toString();
    } else {
      statusCaloria = StatusCaloria.Excesso.toString();
    }
  }
}

class Produto {
  Produto(this.nome, this.calorias);

  final String nome;

  final num calorias;
}

abstract class Fornecedor {
  final _random = Random();

  List<Produto> produtosDisponiveis = [];

  Produto fornecer() {
    return produtosDisponiveis[_random.nextInt(produtosDisponiveis.length)];
  }
}

class FornecedorUltraCaloricos extends Fornecedor {
  @override
  List<Produto> produtosDisponiveis = [
    Produto('Salgadinho', 730),
    Produto('amendoim', 600),
    Produto('Queijo', 560),
    Produto('Leite', 130),
    Produto('CaixaDeChocolate', 1350),
  ];
}

class FornecedorDoces extends Fornecedor {
  @override
  List<Produto> produtosDisponiveis = [
    Produto('Bolo', 380),
    Produto('Sorvete', 600),
    Produto('DoceDeleite', 360),
    Produto('Chocolate', 300),
    Produto('BolachaRecheada', 150),
  ];
}

class FornecedorComidas extends Fornecedor {
  @override
  List<Produto> produtosDisponiveis = [
    Produto('Carne', 440),
    Produto('pãoComOvo', 590),
    Produto('Hamburguer', 700),
    Produto('Feijoada', 700),
    Produto('Salada', 120),
  ];
}

class FornecedorDeBebidas extends Fornecedor {
  @override
  List<Produto> produtosDisponiveis = [
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];
}
