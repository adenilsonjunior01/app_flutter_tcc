import 'package:app_tcc/app/modules/home/home_module.dart';
import 'package:app_tcc/app/modules/login/login_module.dart';
import 'package:app_tcc/app/modules/login/login_page.dart';
import 'package:app_tcc/app/pages/splash/splash_page.dart';

import 'pages/splash/splash_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $SplashController,
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
