import 'dart:convert';

import 'package:app_tcc/app/modules/home/home_status_request.dart';
import 'package:app_tcc/app/modules/home/repositories/home_repository.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/jwt_token_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  HomeRepository repository;
  _HomeControllerBase({this.repository});
  @observable
  int value = 0;

  @observable
  String users;

  @observable
  String perfil;

  @observable
  var listProcedimentosGeral = ObservableList();

  @observable
  HomeStatusRequest status = HomeStatusRequest.none;

  @observable
  String firstLetter;

  @action
  Future jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    perfil = user.perfis.first;
    users = user.nome;
    firstLetter = users[0].toUpperCase();
  }

  @action
  logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Modular.link.pop();
  }

  @action
  Future getProcedimentosGeral(BuildContext context) async {
    // status = HomeStatusRequest.loading;
    try {
      var procedimentos = await repository.getDadosProcedimentosGeral;
      listProcedimentosGeral.clear();
      // listProcedimentosGeral.add(procedimentos);
      status = HomeStatusRequest.success;
    } catch (e) {
      status = HomeStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Geral!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @observable
  Map<String, double> dataMap = {
    "Exame": 5,
    "Emergência": 3,
    "Consulta Médica": 2,
  };

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
