import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

    Future.delayed(Duration(seconds: 10))
        .then((value) => {Modular.to.pushReplacementNamed('/login')});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xFF140CCB), Color(0xFF5A5DCB)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: Align(
          alignment: Alignment.center,
          child: Lottie.asset('assets/lotties-animation/lottie-splash-3.json',
              width: 300),
        ));
  }
}
