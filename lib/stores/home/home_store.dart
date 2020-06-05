import 'package:climahoje/data/home/home_data.dart';
import 'package:climahoje/models/clima_cidade/clima_cidade.dart';
import 'package:geolocator/geolocator.dart';

import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  DataHome dados = DataHome();

  @observable
  ClimaCidade climaCidade = ClimaCidade();

  @observable
  bool carregandoDados = false;

  Future<ClimaCidade> buscarClima() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

    ClimaCidade climaCidade = await dados.buscarClima(
      lat: position.latitude,
      log: position.longitude,
    );

    return climaCidade;
  }
}
