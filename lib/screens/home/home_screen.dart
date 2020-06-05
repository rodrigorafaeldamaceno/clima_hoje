import 'package:climahoje/models/clima_cidade/clima_cidade.dart';
import 'package:climahoje/stores/home/home_store.dart';
import 'package:climahoje/utils/classes/utils_data.dart';
import 'package:climahoje/utils/tema/tema.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size size;

  HomeStore controller = HomeStore();

  @override
  void initState() {
    controller.carregandoDados = true;
    controller.buscarClima().then((value) {
      controller.carregandoDados = false;
      if (value == null) return;

      controller.climaCidade = value;
    });
    super.initState();
  }

  Widget cardClimaNaSemana(Forecast dadosDoDia) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Tema.corPrincipal.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          Text(
            dadosDoDia.weekday,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            dadosDoDia.date.substring(0, 2),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Image.asset(
            Tema.verificaImagem(dadosDoDia.condition),
            width: 75,
            height: 75,
          ),
          // Tema.chuvoso,
          SizedBox(
            height: 10,
          ),
          Text(
            '${dadosDoDia.min}°',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Divider(
              color: Colors.white,
            ),
          ),
          Text(
            '${dadosDoDia.max}°',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget cardClimaDoDia() {
    String diaDaSemana = UtilsData.pegarDiaDaSemanaCompleto(
        controller.climaCidade.results.forecast[0].weekday);

    String temperaturaMinima =
        controller.climaCidade.results.forecast[0].min.toString();

    String temperaturaMaxima =
        controller.climaCidade.results.forecast[0].max.toString();

    return Container(
      height: size.height * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            diaDaSemana,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Flexible(
            child: Text(
              'Situação: ${controller.climaCidade.results.description} ',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '${controller.climaCidade.results.temp}°',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        '$temperaturaMinima°',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Center(
                        widthFactor: 2,
                        child: Text(
                          '-',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      Text(
                        '$temperaturaMaxima°',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Image.asset(
                Tema.verificaImagem(
                  controller.climaCidade.results.forecast[0].condition,
                ),
                width: 200,
                height: 200,
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        centerTitle: true,
        title: Observer(builder: (_) {
          return Text(
            controller.carregandoDados || controller.climaCidade == null
                ? ''
                : '${controller.climaCidade.results.city}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          );
        }),
      ),
      body: Observer(builder: (_) {
        if (controller.climaCidade == null) return Container();

        return SingleChildScrollView(
          child: controller.carregandoDados
              ? Container(
                  height: size.height * 0.8,
                  child: Center(child: CircularProgressIndicator()),
                )
              : Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    cardClimaDoDia(),
                    Container(
                      height: size.height * 0.35,
                      child: ListView.builder(
                        itemCount:
                            controller.climaCidade.results.forecast.length - 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return cardClimaNaSemana(
                            controller.climaCidade.results.forecast[index + 1],
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
