import 'repositories/register_user_repository.dart';
import 'package:app_tcc/app/app_widget.dart';
import 'package:app_tcc/app/modules/home/home_module.dart';
import 'package:app_tcc/app/modules/login/pages/cadastro_user/cadastro_user_controller.dart';
import 'package:app_tcc/app/modules/login/pages/cadastro_user/cadastro_user_page.dart';
import 'package:app_tcc/app/modules/login/pages/resetar_senha/resetar_senha_page.dart';
import 'package:app_tcc/app/modules/login/repositories/auth_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'pages/resetar_senha/resetar_senha_controller.dart';
import 'login_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegisterUserRepository,
        Bind((i) => AuthRepository(i.get<Dio>())),
        $ResetarSenhaController,
        $LoginController,
        $CadastroUserController
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/',
            child: (_, args) => LoginPage(),
            transition: TransitionType.leftToRight),
        ModularRouter('/resetar-senha', child: (_, args) => ResetarSenhaPage()),
        ModularRouter('/cadastro-user', child: (_, args) => CadastroUserPage()),
        ModularRouter('/home', module: HomeModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<LoginModule>.of();
}
