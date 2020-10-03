import 'package:app_tcc/app/modules/login/login_module.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_page.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_page.dart';
import 'package:app_tcc/app/pages/splash/splash_page.dart';
import 'package:app_tcc/app/pages/steps-info/step_first/step_first_page.dart';
import 'package:app_tcc/app/pages/steps-info/step_first/step_first_controller.dart';
import 'package:app_tcc/app/pages/steps-info/step_second/step_second_controller.dart';
import 'package:app_tcc/app/pages/steps-info/step_second/step_second_page.dart';
import 'package:dio/dio.dart';

import 'pages/splash/splash_controller.dart';
import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/app/app_widget.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => Dio()),
        $SplashController,
        $AppController,
        $StepFirstController,
        $StepSecondController,
        $AlergiaController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SplashPage()),
        // ModularRouter('/', child: (_, args) => AlergiaPage()),
        ModularRouter('/first',
            child: (_, args) => StepFirstPage(),
            transition: TransitionType.leftToRight),
        ModularRouter('/second',
            child: (_, args) => StepSecondPage(),
            transition: TransitionType.fadeIn),
        ModularRouter('/login', module: LoginModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
