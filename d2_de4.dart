# academy_desafio_d2

  import 'dart:math' as math;

void main() {
  final formas = [
    Circulo('Círculo A', 3),
    Circulo('Círculo B', 8),
    Retangulo('Retângulo A', 4, 3),
    Retangulo('Retângulo B', 19, 11),
    TrianguloEquilatero('Triângulo Equilátero A', 5),
    TrianguloEquilatero('Triângulo Equilátero B', 7),
    TrianguloRetangulo('Triângulo Retângulo A', 3, 4),
    TrianguloRetangulo('Triângulo Retângulo B', 5, 12),
    PentagonoRegular('Pentágono Regular A', 6),
    PentagonoRegular('Pentágono Regular B', 8),
    HexagonoRegular('Hexágono Regular A', 4),
    HexagonoRegular('Hexágono Regular B', 7),
  ];

  final maiorArea = compararFormas(formas, (forma) => forma.calcularMedida());
  final maiorPerimetro =
      compararFormas(formas, (forma) => forma.calcularMedida());

  print(
      'A maior área é ${maiorArea.calcularMedida().toStringAsFixed(2)} e pertence a ${maiorArea.nome}');
  print(
      'O maior perímetro é ${maiorPerimetro.calcularMedida().toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}');
}

abstract class FormaGeometrica {
  FormaGeometrica(this.nome);

  final String nome;

  double calcularMedida();
}

class Circulo extends FormaGeometrica {
  Circulo(String nome, this.raio) : super(nome);

  final double raio;

  @override
  double calcularMedida() => raio;
}

class Retangulo extends FormaGeometrica {
  Retangulo(String nome, this.altura, this.largura) : super(nome);

  final double altura;
  final double largura;

  @override
  double calcularMedida() => altura * largura;
}

class TrianguloEquilatero extends FormaGeometrica {
  TrianguloEquilatero(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularMedida() => (math.sqrt(3) / 4) * math.pow(lado, 2);
}

class TrianguloRetangulo extends FormaGeometrica {
  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  final double base;
  final double altura;

  @override
  double calcularMedida() =>
      base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

class PentagonoRegular extends FormaGeometrica {
  PentagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularMedida() => (5 * lado * lado) / (4 * math.tan(math.pi / 5));
}

class HexagonoRegular extends FormaGeometrica {
  HexagonoRegular(String nome, this.lado) : super(nome);

  final double lado;

  @override
  double calcularMedida() => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;
}

FormaGeometrica compararFormas(
    List<FormaGeometrica> formas, double Function(FormaGeometrica) medida) {
  return formas.reduce(
      (atual, proximo) => medida(proximo) > medida(atual) ? proximo : atual);
}
