import 'dart:convert';

import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/modules/login/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'models/user_login_model.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final user = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final AuthRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  int value = 0;

  @observable
  LoginStatus status = LoginStatus.none;

  @action
  void increment() {
    value++;
  }

  // Verifica se o formulário é válido, se sim faz o envio dos dados pra autenticar o usuário
  @action
  Future<void> submitForm(BuildContext context) async {
    // bool formValido = formKey.currentState.validate();
    // if (!formValido) {
    //   return;
    // }

    status = LoginStatus.loading;
    Map paramsLogin = {
      "email": 'felixbastos.lucas@gmail.com',
      "senha": "asdqwe123"
    };
    // UserLoginModel body = UserLoginModel.fromJson(paramsLogin);
    var body = json.encode(paramsLogin);

    String login = user.text;
    String senha = password.text;

    try {
      // var usuario = await LoginApi.login(login, senha);
      final usuario = await repository.authentication(body);
      status = LoginStatus.success..value = usuario;
      print(usuario);
      if (usuario != null) {
        _navegaHomePage(context);
      } else {
        final snackbar = SnackBar(
          content: Text('Usuário ou senha inválido'),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      }
    } catch (e) {
      status = LoginStatus.error..value = e;
    }
  }

  // Após login o usuário é direcionado para página Home
  @action
  _navegaHomePage(BuildContext context) {
    Modular.link.pushNamed('/home');
  }

  @action
  navegateResetarSenha(BuildContext context) {
    Modular.link.pushNamed('/resetar-senha');
  }

  @action
  navegaRegisterUserPage(BuildContext context) {
    Modular.link.pushNamed('/cadastro-user');
  }
}
