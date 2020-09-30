import 'package:app_tcc/app/modules/home/widgets/custom_drawer.dart';
import 'package:app_tcc/app/modules/home/widgets/tab/home_tab.dart';
import 'package:app_tcc/app/modules/home/widgets/tab/titles_cadastro_tab.dart';
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
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text("Cadastro"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: TitlesCadastroTab(),
        )
      ],
    );
  }
}
