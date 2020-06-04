// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$climaCidadeAtom = Atom(name: '_HomeStoreBase.climaCidade');

  @override
  ClimaCidade get climaCidade {
    _$climaCidadeAtom.reportRead();
    return super.climaCidade;
  }

  @override
  set climaCidade(ClimaCidade value) {
    _$climaCidadeAtom.reportWrite(value, super.climaCidade, () {
      super.climaCidade = value;
    });
  }

  final _$carregandoDadosAtom = Atom(name: '_HomeStoreBase.carregandoDados');

  @override
  bool get carregandoDados {
    _$carregandoDadosAtom.reportRead();
    return super.carregandoDados;
  }

  @override
  set carregandoDados(bool value) {
    _$carregandoDadosAtom.reportWrite(value, super.carregandoDados, () {
      super.carregandoDados = value;
    });
  }

  @override
  String toString() {
    return '''
climaCidade: ${climaCidade},
carregandoDados: ${carregandoDados}
    ''';
  }
}
