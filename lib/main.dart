import 'package:climahoje/utils/rotas_app/rotas.dart';
import 'package:climahoje/utils/tema/tema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    defaultHome: '/home',
  ));
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
        // primarySwatch: Colors.blue,
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
