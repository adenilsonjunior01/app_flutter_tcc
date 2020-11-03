import 'dart:convert';

import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/repositories/meus_dados_medicos_repository.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'meus_dados_medicos_controller.g.dart';

@Injectable()
class MeusDadosMedicosController = _MeusDadosMedicosControllerBase
    with _$MeusDadosMedicosController;

abstract class _MeusDadosMedicosControllerBase with Store {
  MeusDadosMedicosRepository repository;
  _MeusDadosMedicosControllerBase(this.repository);

  GlobalKey<FormBuilderState> formBuildKey = GlobalKey<FormBuilderState>();
  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  @observable
  var tipoSanguineo;

  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  @observable
  var listSanguineo = ObservableList();

  @action
  Future editDadosMedicos(BuildContext context) async {
    Map<String, dynamic> params = {
      'altura': double.parse(altura.text),
      'peso': double.parse(peso.text),
      'tipoSanguineo': tipoSanguineo.id,
    };

    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.dadosMedicos(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Dados Médicos atualizado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao atualizar Dados Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  getTiposAlergia(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var tipos = await repository.getTiposAlergia;
      listSanguineo.clear();
      tipos.forEach((value) => listSanguineo.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao tipos de Alergias!',
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
