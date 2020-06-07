import 'package:intl/intl.dart';

class UtilsData {
  static String converterData(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");

    return dateFormat.format(parsedDate);
  }

  static String pegarDiaDaSemana(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("EEEE");

    return dateFormat.format(parsedDate);
  }

  static String pegarDiaDoMes(String data) {
    var parsedDate = DateTime.parse(data);
    DateFormat dateFormat = DateFormat("d");

    String diaDoMes = dateFormat.format(parsedDate);

    return diaDoMes.length == 2 ? diaDoMes : '0$diaDoMes';
  }

  static String pegarDiaDaSemanaCompleto(String dia) {
    switch (dia) {
      case 'Seg':
        return 'Segunda-feira';
        break;
      case 'Ter':
        return 'Terça-feira';
        break;
      case 'Qua':
        return 'Quarta-feira';
        break;
      case 'Qui':
        return 'Quinta-feira';
        break;
      case 'Sex':
        return 'Sexta-feira';
        break;
      case 'Sáb':
        return 'Sábado';
        break;
      case 'Dom':
        return 'Domingo';
        break;
      default:
    }
  }
}
