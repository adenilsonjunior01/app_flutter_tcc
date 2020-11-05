import 'package:app_tcc/app/modules/profile/repositories/interfaces/profile_repository_interface.dart';
import 'package:app_tcc/app/modules/profile/repositories/profile_repository.dart';
import 'package:app_tcc/app/modules/qr_code/repositories/interfaces/qr_code_repository_interface.dart';
import 'package:app_tcc/app/modules/qr_code/repositories/qr_code_repository.dart';
import 'package:app_tcc/app/modules/registros/interfaces/meus_dados_medicos_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/meus_dados_medicos/meus_dados_medicos_page.dart';

import 'repositories/meus_dados_medicos_repository.dart';
import 'pages/meus_dados_medicos/meus_dados_medicos_controller.dart';
import 'package:app_tcc/app/modules/registros/interfaces/dados_medicos_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/pages/dados_medicos/dados_medicos_page.dart';
import 'package:app_tcc/app/modules/registros/repositories/dados_medicos_repository.dart';

import 'pages/dados_medicos/dados_medicos_controller.dart';
import 'package:app_tcc/app/modules/login/login_module.dart';
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
        $MeusDadosMedicosRepository,
        $MeusDadosMedicosController,
        $DadosMedicosController,
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
        Bind<IDadosMedicosRepository>(
            (i) => DadosMedicosRepository(i.get<Dio>())),
        Bind<IMeusDadosMedicosInterface>(
            (i) => MeusDadosMedicosRepository(i.get<Dio>())),
        Bind<IMeusDadosMedicosInterface>(
            (i) => MeusDadosMedicosRepository(i.get<Dio>())),
        Bind<IQrCodeRepository>((i) => QrCodeRepository(i.get<Dio>())),
        Bind<IProfileRepository>((i) => ProfileRepository(i.get<Dio>())),
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
        ModularRouter('/dados-medicos', child: (_, args) => DadosMedicosPage()),
        ModularRouter('/meus-dados-medicos',
            child: (_, args) => MeusDadosMedicosPage()),
        ModularRouter('/login', module: LoginModule())
      ];

  static Inject get to => Inject<RegistrosModule>.of();
}
