import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/home/widgets/tiles/drawer_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDrawer extends StatefulWidget {
  final PageController pageController;

  CustomDrawer({this.pageController});

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
                decoration: BoxDecoration(color: Color(0xFF388AF7)),
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
                            color: Colors.white,
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
                                color: Colors.white),
                          ),
                          Observer(builder: (_) {
                            return Text(
                              controller.users != null
                                  ? controller.users.toUpperCase()
                                  : '',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            );
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
              DrawerTile(
                'icon_inicio.svg',
                "Início",
                widget.pageController,
                0,
              ),

              // Meus Dados
              InkWell(
                onTap: () {
                  Modular.to.pushNamed('/profile');
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                          'assets/images/home/icon_meus_dados.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Perfil',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              // QR Code
              InkWell(
                onTap: () {
                  Modular.to.pushNamed('/qrcode');
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/home/icon_qrcode.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'QR Code',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              // DrawerTile(
              //     'icon_cadastro.svg', "Cadastro", widget.pageController, 1),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  widget.pageController.jumpToPage(1);
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              'assets/images/home/icon_cadastro.svg'),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Cadastro',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color(0xFF3B4349),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Observer(
                            builder: (context) {
                              if (controller.perfil == 'PENDENTE') {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Icon(
                                    Icons.error_outline,
                                    color: Colors.red,
                                  ),
                                );
                              } else {
                                return Text('');
                              }
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Modular.to.pushNamed('/registro/dados-medicos');
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/home/icon_historico.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Meus Dados',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Modular.to.pushNamed('/registro/resetar-senha');
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/home/icon_edit.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Alterar Senha',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  controller.logout();
                },
                child: Container(
                  height: 50,
                  padding: EdgeInsets.only(left: 23),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/home/icon_sair.svg'),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Sair',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF3B4349),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
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
