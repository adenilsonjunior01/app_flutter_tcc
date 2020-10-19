import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:app_tcc/app/modules/home/widgets/custom_drawer.dart';
import 'package:app_tcc/app/modules/home/widgets/tab/home_tab.dart';
import 'package:app_tcc/app/modules/home/widgets/tab/titles_cadastro_tab.dart';
import 'package:app_tcc/app/modules/login/pages/resetar_senha/resetar_senha_page.dart';
import 'package:app_tcc/app/modules/profile/profile_page.dart';
import 'package:app_tcc/app/modules/qr_code/qr_code_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomeTab(),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Cadastro"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: TitlesCadastroTab(),
        ),
        // PAGINA DO HISTÓRICO
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        // PAGINA DE ALTERAR SENHA
        Scaffold(
          body: ResetarSenhaPage(),
          drawer: CustomDrawer(_pageController),
        ),
        // PAGINA DE PERFIL
        Scaffold(
          body: ProfilePage(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          body: QrCodePage(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}
