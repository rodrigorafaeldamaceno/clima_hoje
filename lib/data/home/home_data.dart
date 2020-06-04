import 'package:climahoje/models/clima_cidade/clima_cidade.dart';
import 'package:climahoje/utils/rotas_api/rotas_api.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DataHome {
  Future<ClimaCidade> buscarClimaPorCidade({int idCidade}) async {
    ClimaCidade climaCidade = ClimaCidade();

    print(' "${RotasApi.BUSCAR_CLIMA_POR_CIDADE}/$idCidade/days/15"');
    String token = DotEnv().env['TOKEN'];

    try {
      Response response = await Dio().get(
        "${RotasApi.BUSCAR_CLIMA_POR_CIDADE}/$idCidade/days/15",
        queryParameters: {'token': token},
        options: buildCacheOptions(
          Duration(days: 2),
          forceRefresh: true,
          maxStale: Duration(days: 3),
          options: Options(
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            },
          ),
        ),
      );

      if (response.statusCode == 200) {
        climaCidade = ClimaCidade.fromJson(response.data);
      } else {
        print(response.statusCode.toString());
      }
    } catch (error) {
      print(error);
    }
    return climaCidade;
  }
}
