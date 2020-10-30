import 'package:app_tcc/app/modules/registros/interfaces/procedimento_medico_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/procedimento_medico/procedimento_medico_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/procedimento_medico/procedimento_medico_page.dart';

import 'repositories/procedimento_medico_repository.dart';
import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_page.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_page.dart';

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
        $ProcedimentoMedicoRepository,
        $ProcedimentoMedicoController,
        $AlergiaRepository,
        Bind<IMedicamentoRepository>(
            (i) => MedicamentoRepository(i.get<Dio>())),
        Bind<IAlergiaRepostory>((i) => AlergiaRepository(i.get<Dio>())),
        Bind<IDoencaCronicaRepository>(
            (i) => DoencaCronicaRepository(i.get<Dio>())),
        Bind<IProcedimentoMedicoRepository>(
            (i) => ProcedimentoMedicoRepository(i.get<Dio>())),
        Bind((i) => MedicamentoController(i.get())),
        Bind((i) => DoencaCronicaController(i.get())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => AlergiaPage()),
        ModularRouter('/medicamento', child: (_, args) => MedicamentoPage()),
        ModularRouter('/alergia', child: (_, args) => AlergiaPage()),
        ModularRouter('/doenca-cronica',
            child: (_, args) => DoencaCronicaPage()),
        ModularRouter('/procedimento-medico',
            child: (_, args) => ProcedimentoMedicoPage()),
      ];

  static Inject get to => Inject<RegistrosModule>.of();
}
