import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'splash_controller.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)) // 5
        .then((value) => {controller.verificaPrimeiroAcesso()});
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: _altura,
          width: _largura,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_splash.png'),
                  fit: BoxFit.fill)),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, top: _altura / 2 - 180),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 100,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 15, left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "NomeApp",
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Inter Medium',
                      fontSize: 36),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 40),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gerencie seus \ndados médicos",
                  style: TextStyle(
                      color: Colors.black38, fontFamily: 'Inter', fontSize: 24),
                ),
              )
            ],
          )),
    );
  }
}
