import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_page.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_page.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrosModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [$AlergiaController, $MedicamentoController, $DoencaCronicaController];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => DoencaCronicaPage()),
        ModularRouter('/registros/alergia', child: (_, args) => AlergiaPage()),
        ModularRouter('/registros/medicamento',
            child: (_, args) => MedicamentoPage())
      ];

  static Inject get to => Inject<RegistrosModule>.of();
}
