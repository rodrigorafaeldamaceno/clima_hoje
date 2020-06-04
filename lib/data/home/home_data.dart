import 'package:climahoje/models/clima_cidade/clima_cidade.dart';
import 'package:climahoje/utils/rotas_api/rotas_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataHome {
  DataHome() {
    DotEnv().load('.env');
  }

  Future<ClimaCidade> buscarClimaPorCidade({int idCidade}) async {
    ClimaCidade climaCidade = ClimaCidade();

    print(' "${RotasApi.BUSCAR_CLIMA_POR_CIDADE}/$idCidade/days/15"');
    try {
      Response response = await Dio().get(
        "${RotasApi.BUSCAR_CLIMA_POR_CIDADE}/$idCidade/days/15",
        queryParameters: {'token': 'e5ec13e4e21beb0f1e236acad4714f8c'},
        options: Options(
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        climaCidade = ClimaCidade.fromJson(response.data);
        print(climaCidade.toJson());
      } else {
        print(response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
    return climaCidade;
  }
}
