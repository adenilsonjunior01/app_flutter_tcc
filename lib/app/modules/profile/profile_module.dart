import 'package:app_tcc/app/modules/profile/repositories/interfaces/profile_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/registros_module.dart';
import 'package:dio/dio.dart';
import 'repositories/profile_repository.dart';
import 'profile_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'profile_page.dart';

class ProfileModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ProfileRepository,
        $ProfileController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => ProfilePage()),
        ModularRouter('/registro', module: RegistrosModule()),
      ];

  static Inject get to => Inject<ProfileModule>.of();
}
