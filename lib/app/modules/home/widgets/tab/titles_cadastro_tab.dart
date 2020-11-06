import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:app_tcc/app/modules/home/widgets/tiles/titles_cadastro_tile.dart';
import 'package:app_tcc/app/shared/utils/list_title_cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TitlesCadastroTab extends StatefulWidget {
  HomeController controller;
  BuildContext context2;
  TitlesCadastroTab({this.controller, this.context2});

  @override
  _TitlesCadastroTabState createState() => _TitlesCadastroTabState();
}

class _TitlesCadastroTabState extends State<TitlesCadastroTab> {
  dynamic lista = [
    {"id": 1, "name": "Dados Médicos", "icon": ""},
    {"id": 2, "name": "Alergia", "icon": ""},
    {"id": 3, "name": "Doença Crônica", "icon": ""},
    {"id": 4, "name": "Medicamento", "icon": ""},
    {"id": 5, "name": "Procedimento Médico", "icon": ""},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('>>>>${widget.controller.perfil}');
  }

  @override
  Widget build(BuildContext context) {
    var dividedTiles =
        ListTile.divideTiles(context: context, color: Colors.grey[500], tiles: [
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          lista[0]['name'],
          style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        trailing: Observer(
          builder: (context) {
            if (widget.controller.perfil == 'PENDENTE') {
              return Icon(
                Icons.error_outline,
                color: Colors.red,
              );
            } else {
              return Icon(Icons.keyboard_arrow_right);
            }
          },
        ),
        onTap: () {
          Modular.link.pushNamed('/registro/meus-dados-medicos');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          lista[1]['name'],
          style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Modular.link.pushNamed('/registro/alergia');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          lista[2]['name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Modular.link.pushNamed('/registro/doenca-cronica');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(lista[3]['name'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Navigator.pushNamed(context, '/registros/medicamento');
          Modular.link.pushNamed('/registro/medicamento');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(lista[4]['name'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Navigator.pushNamed(context, '/registros/medicamento');
          Modular.link.pushNamed('/registro/procedimento-medico');
        },
      ),
    ]).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                  Modular.link.pushNamed('/registro/meus-dados-medicos'),
              child: Container(
                height: 145,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/menu/bg_menu_dados_medicos.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        'Dados \nMédicos',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.playlist_add,
                            size: 25,
                            color: Colors.white,
                          ),
                          Icon(Icons.person_outline,
                              size: 25, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Modular.link.pushNamed('/registro/alergia'),
              child: Container(
                height: 145,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/menu/bg_menu_alergia.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        'Alergia',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 35, left: 30),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/menu/icon/icon_alergia.svg'),
                          Icon(Icons.add, size: 25, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Modular.link.pushNamed('/registro/doenca-cronica'),
              child: Container(
                height: 145,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/menu/bg_menu_doenca_cronica.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        'Doença \nCrônica',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 30),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/menu/icon/icon_procedimento.svg'),
                          Icon(Icons.add, size: 25, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Modular.link.pushNamed('/registro/medicamento'),
              child: Container(
                height: 145,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/menu/bg_menu_medicamento.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 30),
                      child: Text(
                        'Medicamento',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.playlist_add,
                            size: 25,
                            color: Colors.white,
                          ),
                          Icon(Icons.add, size: 25, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () =>
                  Modular.link.pushNamed('/registro/procedimento-medico'),
              child: Container(
                height: 145,
                width: 170,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/images/menu/bg_menu_procedimento.png'),
                        fit: BoxFit.cover)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 25, left: 30),
                      child: Text(
                        'Procedimento \nMédico',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15, left: 30),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/menu/icon/icon_procedimento.svg'),
                          Icon(Icons.add, size: 25, color: Colors.white),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
