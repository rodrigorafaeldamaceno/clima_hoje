import 'package:climahoje/utils/rotas_app/rotas.dart';
import 'package:climahoje/utils/tema/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  DotEnv().load('.env').then((value) => null);

  Intl.defaultLocale = 'pt_BR';

  initializeDateFormatting('pt_BR').then(
    (_) => runApp(MyApp(defaultHome: '/home')),
  );
}

class MyApp extends StatelessWidget {
  MyApp({this.defaultHome});

  final String defaultHome;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clima Hoje',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Tema.corPrincipal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      initialRoute: defaultHome,
      onGenerateRoute: Rotas.generateRoute,
      navigatorKey: Rotas.navigatorKey,
    );
  }
}
