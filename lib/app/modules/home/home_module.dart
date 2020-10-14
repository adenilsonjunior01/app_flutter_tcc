import 'package:app_tcc/app/modules/login/login_module.dart';
import 'package:app_tcc/app/modules/registros/interfaces/alergia_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/interfaces/medicamento_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_page.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_page.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_page.dart';
import 'package:app_tcc/app/modules/registros/registros_controller.dart';
import 'package:app_tcc/app/modules/registros/registros_module.dart';
import 'package:app_tcc/app/modules/registros/repositories/alergia_repository.dart';
import 'package:app_tcc/app/modules/registros/repositories/doenca_cronica_repository.dart';
import 'package:app_tcc/app/modules/registros/repositories/medicamento_repository.dart';
import 'package:dio/dio.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind<IMedicamentoRepository>(
            (i) => MedicamentoRepository(i.get<Dio>())),
        Bind<IDoencaCronicaRepository>(
            (i) => DoencaCronicaRepository(i.get<Dio>())),
        Bind<IAlergiaRepostory>((i) => AlergiaRepository(i.get<Dio>())),
        $RegistrosController,
        $HomeController,
        $AlergiaController,
        $MedicamentoController,
        $DoencaCronicaController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute,
            child: (_, args) => HomePage(), transition: TransitionType.fadeIn),
        ModularRouter('/registro', module: RegistrosModule()),
        ModularRouter(
          '/registro/alergia',
          child: (_, args) => AlergiaPage(),
          transition: TransitionType.downToUp,
        ),
        ModularRouter('/registro/medicamento',
            transition: TransitionType.downToUp,
            child: (_, args) => MedicamentoPage()),
        ModularRouter('/registro/doenca-cronica',
            transition: TransitionType.downToUp,
            child: (_, args) => DoencaCronicaPage()),
        ModularRouter('/login', module: LoginModule())
      ];

  static Inject get to => Inject<HomeModule>.of();
}
