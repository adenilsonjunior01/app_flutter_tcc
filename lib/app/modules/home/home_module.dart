import 'package:app_tcc/app/modules/registros/registros_controller.dart';
import 'package:app_tcc/app/modules/registros/registros_module.dart';
import 'package:dio/dio.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        $RegistrosController,
        $HomeController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HomePage(), transition: TransitionType.fadeIn),
        ModularRouter('/registro', module: RegistrosModule())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
