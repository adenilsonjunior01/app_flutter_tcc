import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/home/widgets/tiles/drawer_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  HomeController controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.jwtDecode();
  }

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context).settings.arguments;
    Widget _buildDrawerBack() => Container(
          color: Color(0xFFF4F4F4),
        );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(top: 0),
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/step/bg_step.png'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(32, 22, 16, 8),
                height: 200,
                child: Stack(
                  children: [
                    Positioned(
                      top: 15,
                      left: 0,
                      child: Text(
                        'App Flutter \nTCC',
                        style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Olá,',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3B4349)),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              controller.users != null
                                  ? controller.users.toUpperCase()
                                  : '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF3B4349)),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home, "Início", widget.pageController, 0),
              DrawerTile(
                  Icons.account_box, "Meus Dados", widget.pageController, 4),
              DrawerTile(
                  Icons.account_box, "QR Code", widget.pageController, 5),
              DrawerTile(Icons.add, "Cadastro", widget.pageController, 1),
              DrawerTile(Icons.list, "Histórico", widget.pageController, 2),
              DrawerTile(
                  Icons.vpn_key, "Alterar Senha", widget.pageController, 3),
              InkWell(
                onTap: () {
                  // CORRIGIR LOGOUT
                  Navigator.of(context).pop();
                  controller.logout();
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,
                          size: 25, color: Colors.grey[700]),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF222222),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _logout() {
    return FlatButton(
      onPressed: () {
        controller.logout();
      },
      child: null,
    );
  }
}
