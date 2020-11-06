import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:app_tcc/app/modules/home/home_status_request.dart';
import 'package:app_tcc/app/shared/widgets/shimmer_layout_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:random_color/random_color.dart';
import 'package:shimmer/shimmer.dart';

class HomeTab extends StatefulWidget {
  GlobalKey<ScaffoldState> scaffoldKey;
  HomeController controller;
  HomeTab({this.scaffoldKey, this.controller});

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<ScaffoldState> scaffoldKey;
  var _margin = EdgeInsets.only(left: 10, right: 10);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.controller.jwtDecode();
    widget.controller.getProcedimentosGeral(context);
    widget.controller.getQuantitativos(context);
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
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
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
                              widget.controller.firstLetter != null
                                  ? widget.controller.firstLetter
                                  : ' ',
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
                              widget.controller.users != null
                                  ? widget.controller.users.toUpperCase()
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
                            "Perfil: ${widget.controller.perfil != null ? widget.controller.perfil : ''}",
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
                            'Procedimentos Médicos Geral',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xFF3B4349),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _chartPie(context),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(bottom: 10),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Quantitativos',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xFF3B4349),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        _quantitativos(context)
                      ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }

  _chartPie(BuildContext context) {
    return Observer(builder: (_) {
      if (widget.controller.dataMap == null) {
        return Text('');
      } else {
        return PieChart(
          dataMap: widget.controller.dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32,
          chartRadius: MediaQuery.of(context).size.width / 3.8,
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
      }
    });
  }

  _quantitativos(BuildContext context) {
    return Column(
      children: [
        _quantitativoMedicamento(context),
        SizedBox(
          height: 15,
        ),
        _quantitativoAlergia(context),
        SizedBox(
          height: 15,
        ),
        _quantitativoDoencaCronica(context),
        SizedBox(
          height: 15,
        ),
        _quantitativoProcedimentoMedico(context)
      ],
    );
  }

  _quantitativoMedicamento(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 92,
      margin: _margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFFFFFFF)),
      child: Row(
        children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Stack(
                children: [
                  SvgPicture.asset(
                      'assets/images/home/qtd_medicamentos/bg_quantitativo_medicamento.svg'),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    child: SvgPicture.asset(
                        'assets/images/home/qtd_medicamentos/icon_med.svg'),
                  )
                ],
              )),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Medicamentos'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Últimos 30 dias',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Observer(builder: (_) {
                          if (widget.controller.listQuantitativo != null) {
                            return Text(
                              '${widget.controller.listQuantitativo.medicamentos} Registros',
                              style: TextStyle(
                                  color: Color(0xFF3B4349),
                                  fontWeight: FontWeight.bold),
                            );
                          } else {
                            return Text('0 Registro',
                                style: TextStyle(
                                    color: Color(0xFF3B4349),
                                    fontWeight: FontWeight.bold));
                          }
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _quantitativoAlergia(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 92,
      margin: _margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFFFFFFF)),
      child: Row(
        children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Stack(
                children: [
                  Image.asset(
                      'assets/images/home/qtd_alergias/bg_quantitativo_alergias.png'),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    child: SvgPicture.asset(
                        'assets/images/home/qtd_alergias/icon_alergia.svg'),
                  )
                ],
              )),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Alergias'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Últimos 30 dias',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Observer(builder: (_) {
                          if (widget.controller.listQuantitativo != null) {
                            return Text(
                              '${widget.controller.listQuantitativo.alergias} Registros',
                              style: TextStyle(
                                  color: Color(0xFF3B4349),
                                  fontWeight: FontWeight.bold),
                            );
                          } else {
                            return Text('0 Registro',
                                style: TextStyle(
                                    color: Color(0xFF3B4349),
                                    fontWeight: FontWeight.bold));
                          }
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _quantitativoDoencaCronica(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 92,
      margin: _margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFFFFFFF)),
      child: Row(
        children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Stack(
                children: [
                  SvgPicture.asset(
                      'assets/images/home/qtd_doencas/bg_quantitativo_doencas.svg'),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    child: SvgPicture.asset(
                        'assets/images/home/qtd_doencas/icon_doencas.svg'),
                  )
                ],
              )),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Doenças Crônicas'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Últimos 30 dias',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Observer(builder: (_) {
                          if (widget.controller.listQuantitativo != null) {
                            return Text(
                              '${widget.controller.listQuantitativo.doencas} Registros',
                              style: TextStyle(
                                  color: Color(0xFF3B4349),
                                  fontWeight: FontWeight.bold),
                            );
                          } else {
                            return Text('0 Registro',
                                style: TextStyle(
                                    color: Color(0xFF3B4349),
                                    fontWeight: FontWeight.bold));
                          }
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  _quantitativoProcedimentoMedico(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 92,
      margin: _margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFFFFFFF)),
      child: Row(
        children: [
          Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7))),
              child: Stack(
                children: [
                  SvgPicture.asset(
                      'assets/images/home/qtd_procedimentos/bg_quantitativo_procedimentos.svg'),
                  Container(
                    alignment: Alignment.center,
                    width: 110,
                    child: SvgPicture.asset(
                        'assets/images/home/qtd_procedimentos/icon_procedimentos.svg'),
                  )
                ],
              )),
          Expanded(
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Procedimentos\nMédicos'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        Text(
                          'Últimos 30 dias',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: Row(
                      children: [
                        Observer(builder: (_) {
                          if (widget.controller.listQuantitativo != null) {
                            return Text(
                              '${widget.controller.listQuantitativo.procedimentos} Registros',
                              style: TextStyle(
                                  color: Color(0xFF3B4349),
                                  fontWeight: FontWeight.bold),
                            );
                          } else {
                            return Text('0 Registro',
                                style: TextStyle(
                                    color: Color(0xFF3B4349),
                                    fontWeight: FontWeight.bold));
                          }
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
