import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Modular.navigatorKey,
      title: 'App TCC',
      theme: ThemeData(
          fontFamily: 'Inter',
          primarySwatch: Colors.blue,
          primaryColor: Color(0xFF007AFE)),
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
