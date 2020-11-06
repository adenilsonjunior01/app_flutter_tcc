import 'dart:convert';
import 'dart:ffi';

import 'package:app_tcc/app/modules/home/home_status_request.dart';
import 'package:app_tcc/app/modules/home/models/procedimentos_geral_model.dart';
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
  final HomeRepository repository;
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

  @observable
  Map<String, double> dataMap = {
    "Exame": 0,
    "Cirurgia": 0,
    "Consulta Médica": 0,
  };

  @observable
  var listQuantitativo;

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
    status = HomeStatusRequest.loading;
    try {
      var procedimentos = await repository.getDadosProcedimentosGeral;
      dataMaps(procedimentos);

      status = HomeStatusRequest.success;
    } catch (e) {
      status = HomeStatusRequest.error..value = e;
      dataMap = {
        "Exame": 0,
        "Cirurgia": 0,
        "Consulta Médica": 0,
      };
    }
  }

  @action
  Future getQuantitativos(BuildContext context) async {
    status = HomeStatusRequest.loading;
    try {
      var quantitativos = await repository.getQuantitativo;
      listQuantitativo = quantitativos;
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

  Map<String, double> dataMaps(qtd) {
    return dataMap = {
      "Exame":
          qtd.quantidade.exame != null ? qtd.quantidade.exame.toDouble() : 0,
      "Cirurgia": qtd.quantidade.cirurgia != null
          ? qtd.quantidade.cirurgia.toDouble()
          : 0,
      "Consulta Médica": qtd.quantidade.consultaMDica != null
          ? qtd.quantidade.consultaMDica.toDouble()
          : 0,
    };
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
