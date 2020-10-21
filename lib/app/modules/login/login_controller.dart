import 'dart:convert';

import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/modules/login/repositories/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
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
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool formValido = formKey.currentState.validate();
    if (!formValido) {
      return;
    }

    status = LoginStatus.loading;
    Map<String, dynamic> params = {
      'email': user.text,
      'senha': password.text,
    };
    // UserLoginModel body = UserLoginModel.fromJson(paramsLogin);
    var body = json.encode(params);

    String login = user.text;
    String senha = password.text;

    try {
      // var usuario = await LoginApi.login(login, senha);
      final usuario = await repository.authentication(body);
      status = LoginStatus.success..value = usuario;
      await prefs.setString('token', usuario.token);
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
  _navegaHomePage(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    var nameUser = user.nome;

    Modular.link.pushNamed('/home', arguments: nameUser);
  }

  @action
  navegateResetarSenha(BuildContext context) {
    Modular.link.pushNamed('/resetar-senha', arguments: 'pageLogin');
  }

  @action
  navegaRegisterUserPage(BuildContext context) {
    Modular.link.pushNamed('/cadastro-user');
  }

  @action
  initInputs() {
    user.text = '';
    password.text = '';
  }

  @action
  verifyToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');

    try {
      if (jwtToken != null) {
        Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
        JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
        var nameUser = user.nome;
        bool isTokenExpired = JwtDecoder.isExpired(jwtToken);
        if (!isTokenExpired) {
          Modular.link.pushNamed('/home', arguments: nameUser);
        }
      }
    } catch (e) {}
  }
}
