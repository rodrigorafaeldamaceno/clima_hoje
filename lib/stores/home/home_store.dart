import 'package:climahoje/data/home/home_data.dart';
import 'package:climahoje/models/clima_cidade/clima_cidade.dart';

import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  DataHome dados = DataHome();

  @observable
  ClimaCidade climaCidade = ClimaCidade();

  @observable
  bool carregandoDados = false;

  Future<ClimaCidade> buscarClimaPorCidade({int idCidade: 6638}) async {
    return dados.buscarClimaPorCidade(idCidade: idCidade);
  }
}
