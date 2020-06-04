import 'package:climahoje/models/clima_cidade/data.dart';
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
    controller.buscarClimaPorCidade().then((value) {
      controller.carregandoDados = false;
      if (value == null) return;

      controller.climaCidade = value;
    });
    super.initState();
  }

  Widget cardClimaNaSemana(Data dadosDoDia) {
    String diaDaSemana =
        UtilsData.pegarDiaDaSemana(dadosDoDia.date).toUpperCase();

    String diaDoMes = UtilsData.pegarDiaDoMes(dadosDoDia.date);

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
            diaDaSemana.substring(0, 3),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Text(
            UtilsData.pegarDiaDoMes(dadosDoDia.date),
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          Image.asset(
            Tema.imagemChuvoso,
            width: 75,
            height: 75,
          ),
          // Tema.chuvoso,
          SizedBox(
            height: 10,
          ),
          Text(
            '${dadosDoDia.temperature.min}°',
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
            '${dadosDoDia.temperature.max}°',
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
    String diaDaSemana =
        UtilsData.pegarDiaDaSemana(controller.climaCidade.data[0].date)
            .toUpperCase();

    String temperaturaAtual = ((controller.climaCidade.data[0].temperature.max +
                controller.climaCidade.data[0].temperature.min) /
            2)
        .toStringAsFixed(0);

    String temperaturaMinima =
        controller.climaCidade.data[0].temperature.min.toString();

    String temperaturaMaxima =
        controller.climaCidade.data[0].temperature.max.toString();

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
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    '$temperaturaAtual°',
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
                Tema.imagemChuvoso,
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
        title: Observer(builder: (_) {
          return Text(
            controller.carregandoDados || controller.climaCidade == null
                ? ''
                : '${controller.climaCidade.name} - ${controller.climaCidade.state}',
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
                        itemCount: controller.climaCidade.data.length - 1,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return cardClimaNaSemana(
                            controller.climaCidade.data[index + 1],
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
