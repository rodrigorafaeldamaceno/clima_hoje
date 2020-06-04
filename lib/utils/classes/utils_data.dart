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
}
