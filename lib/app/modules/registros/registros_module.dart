import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';

import 'repositories/doenca_cronica_repository.dart';
import 'package:app_tcc/app/modules/registros/interfaces/alergia_repository_interface.dart';

import 'repositories/alergia_repository.dart';
import 'package:app_tcc/app/modules/registros/interfaces/medicamento_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_page.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/repositories/medicamento_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrosModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $AlergiaRepository,
        Bind<IMedicamentoRepository>(
            (i) => MedicamentoRepository(i.get<Dio>())),
        Bind<IAlergiaRepostory>((i) => AlergiaRepository(i.get<Dio>())),
        Bind<IDoencaCronicaRepository>(
            (i) => DoencaCronicaRepository(i.get<Dio>())),
        Bind((i) => MedicamentoController(i.get())),
        Bind((i) => DoencaCronicaController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => AlergiaPage()),
      ];

  static Inject get to => Inject<RegistrosModule>.of();
}
