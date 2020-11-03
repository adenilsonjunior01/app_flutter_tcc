import 'package:app_tcc/app/modules/login/login_module.dart';
import 'package:app_tcc/app/modules/registros/registros_module.dart';
import 'package:dio/dio.dart';
import 'repositories/qr_code_repository.dart';
import 'qr_code_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'qr_code_page.dart';

class QrCodeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $QrCodeRepository,
        $QrCodeController,
        Bind((i) => QrCodeRepository(i.get<Dio>()))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => QrCodePage()),
        ModularRouter('/registro', module: RegistrosModule()),
      ];

  static Inject get to => Inject<QrCodeModule>.of();
}
