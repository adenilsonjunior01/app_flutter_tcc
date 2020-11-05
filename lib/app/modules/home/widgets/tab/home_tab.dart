import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:random_color/random_color.dart';

class HomeTab extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeTab({this.scaffoldKey});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeController controller = HomeController();

  GlobalKey<ScaffoldState> scaffoldKey;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.jwtDecode();
    // controller.getProcedimentosGeral(context);
    scaffoldKey = widget.scaffoldKey;
  }

  @override
  Widget build(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
        colorBrightness: ColorBrightness.light, colorHue: ColorHue.blue);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/form/bg_cadastro.png'),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(''),
                  centerTitle: true,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 100,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  padding: EdgeInsets.only(),
                  width: 330,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      color: Color(0xFFF4F4F4)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Observer(builder: (_) {
                          return CircleAvatar(
                            backgroundColor: _color,
                            foregroundColor: _color,
                            radius: 55,
                            child: Text(
                              controller.firstLetter,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 38),
                            ),
                          );
                        }),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Observer(builder: (_) {
                            return Text(
                              controller.users != null
                                  ? controller.users.toUpperCase()
                                  : '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Inter Medium',
                                fontSize: 20,
                                color: Color(0xFF121212),
                              ),
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Text(
                            "Perfil: ${controller.perfil != null ? controller.perfil : ''}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15, color: Color(0xFFB4B4B4)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Divider(
                            color: Color(0xFFE3E9F8),
                            height: 30,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () =>
                                  Modular.to.pushNamed('/registro/alergia'),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/home/icon_alergia.png'),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text("Alergia",
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black54)),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Modular.to.pushNamed('/registro/medicamento'),
                              child: Column(
                                children: [
                                  Image.asset(
                                      'assets/images/home/icon_medicamentos.png'),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text("Medicamento",
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black54)),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Modular.to
                                  .pushNamed('/registro/doenca-cronica'),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Column(
                                  children: [
                                    Image.asset(
                                        'assets/images/home/icon_doenca_cronica.png'),
                                    Text(
                                      'Doenças \nCrônicas',
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Procedimentos Médicos',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xFF3B4349),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Observer(builder: (_) {
                          return PieChart(
                            dataMap: controller.dataMap,
                            animationDuration: Duration(milliseconds: 800),
                            chartLegendSpacing: 32,
                            chartRadius:
                                MediaQuery.of(context).size.width / 3.8,
                            initialAngleInDegree: 0,
                            chartType: ChartType.ring,
                            ringStrokeWidth: 32,
                            centerText: "Dados",
                            legendOptions: LegendOptions(
                              showLegendsInRow: false,
                              // legendPosition: LegendPosition.right,
                              showLegends: true,
                              legendTextStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            chartValuesOptions: ChartValuesOptions(
                              showChartValueBackground: true,
                              showChartValues: true,
                              showChartValuesInPercentage: false,
                              showChartValuesOutside: false,
                            ),
                          );
                        }),
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
