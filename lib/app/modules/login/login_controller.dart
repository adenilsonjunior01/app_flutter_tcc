import 'dart:convert';

import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/modules/login/models/user_auth_model.dart';
import 'package:app_tcc/app/modules/login/repositories/auth_repository.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
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
  GlobalKey scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final AuthRepository repository;

  _LoginControllerBase(this.repository);

  @observable
  int value = 0;

  @observable
  bool errorLogin = false;

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
    var body = json.encode(params);

    try {
      errorLogin = false;
      final response = await repository.authentication(body);
      if (response.statusCode != 200) {
        status = LoginStatus.error..value = response.statusCode;
        showFlushBar(
            message: 'Usuário ou senha inválido!',
            title: 'Oops!',
            type: 'error',
            context: context);
      } else {
        status = LoginStatus.success..value = response;
        var credentials = UserAuthModel.fromJson(response.data);
        await prefs.setString('token', credentials.token);
        _navegaHomePage(context);
      }
    } catch (e) {
      // errorLogin = true;
      status = LoginStatus.error..value = e;
      showFlushBar(
          message: 'Usuário ou senha inválido!',
          title: 'Oops!',
          type: 'error',
          context: context);
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

    Modular.to.pushNamed('/home', arguments: nameUser);
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
  verifyToken(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');

    try {
      if (jwtToken != null) {
        Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
        JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
        var nameUser = user.nome;
        Modular.link.pushNamed('/home', arguments: nameUser);
      }
    } catch (e) {
      showFlushBar(
          message: 'Erro ao validar Token!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  showFlushBar(
      {String message, String type, String title, BuildContext context}) {
    switch (type) {
      case 'success':
        {
          FlushbarHelper.createSuccess(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'error':
        {
          FlushbarHelper.createError(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'warning':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'info':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      default:
        {
          Flushbar(
            title: title,
            message: message,
            duration: Duration(seconds: 4),
          )..show(context);
          break;
        }
    }
  }
}
