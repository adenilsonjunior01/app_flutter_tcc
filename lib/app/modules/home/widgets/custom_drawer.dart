import 'package:app_tcc/app/modules/home/widgets/tiles/drawer_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
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
                        image: AssetImage('assets/images/home/bg_header.png'),
                        fit: BoxFit.fill)),
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(32, 22, 16, 8),
                height: 220,
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
                            'Olá, ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            'Nome do Usuário',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              DrawerTile(Icons.home, "Início", pageController, 0),
              DrawerTile(Icons.add, "Cadastro", pageController, 1),
              DrawerTile(Icons.list, "Histórico", pageController, 2),
              DrawerTile(Icons.vpn_key, "Alterar Senha", pageController, 3),
            ],
          )
        ],
      ),
    );
  }
}
