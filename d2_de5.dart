# academy_desafio_d2+

import 'dart:math';

void main() {
  final listaCompras1 = ListaCompras();
  final listaCompras2 = ListaCompras();

  listaCompras1.adicionarItem('Laranja', 3);
  listaCompras1.adicionarItem('Morango', 1);

  listaCompras2.adicionarItem('Carne', 2);
  listaCompras2.adicionarItem('Batata', 1);
  listaCompras2.adicionarItem('Mandioca', 5);

  listaCompras1.exibirItensDesejados();
  listaCompras2.exibirItensDesejados();

  listaCompras1.marcarItemComprado('Morango');
  listaCompras1.marcarItemComprado('Laranja');

  listaCompras2.marcarItemComprado('Carne');
  listaCompras2.marcarItemComprado('Batata');

  final itemPendente1 = listaCompras1.escolherItemPendente();
  print('Item pendente listaCompras1: $itemPendente1');

  final itemPendente2 = listaCompras2.escolherItemPendente();
  print('Item pendente listaCompras2: $itemPendente2');

  listaCompras1.mostrarProgresso();

  listaCompras2.mostrarProgresso();
}

class ListaCompras {
  List<ItemCompra> itens = [];

  ListaCompras adicionarItem(String nome, int quantidade) {
    final item = ItemCompra(nome, quantidade);
    itens.add(item);
    return this;
  }

  ListaCompras marcarItemComprado(String nome) {
    final item = _buscarItem(nome);
    if (item != null) {
      item.comprado = true;
    }
    return this;
  }

  void exibirItensDesejados() {
    print("-----------------Itens desejados:--------------");
    for (final item in itens) {
      if (!item.comprado) {
        print('${item.nome} - ${item.quantidade}');
      }
    }
  }

  String escolherItemPendente() {
    print("-----------------Item pendente:-----------------");
    final itensPendentes = itens.where((item) => !item.comprado).toList();
    if (itensPendentes.isNotEmpty) {
      final randomIndex = Random().nextInt(itensPendentes.length);
      return itensPendentes[randomIndex].nome;
    }
    return 'Nenhum item pendente encontrado';
  }

  void mostrarProgresso() {
    print("-----------------Progresso:-----------------");
    final totalItens = itens.length;
    final totalComprados = itens.where((item) => item.comprado).length;
    print('Progresso: $totalComprados/$totalItens');
  }

  ItemCompra? _buscarItem(String nome) {
    for (final item in itens) {
      if (item.nome == nome) {
        return item;
      }
    }
    return null;
  }
}

class ItemCompra {
  final String nome;
  final int quantidade;
  bool comprado;

  ItemCompra(this.nome, this.quantidade) : comprado = false;
}
