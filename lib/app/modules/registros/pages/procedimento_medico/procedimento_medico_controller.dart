import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/procedimento_medico_interface.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../registro_status_request.dart';

part 'procedimento_medico_controller.g.dart';

@Injectable()
class ProcedimentoMedicoController = _ProcedimentoMedicoControllerBase
    with _$ProcedimentoMedicoController;

abstract class _ProcedimentoMedicoControllerBase with Store {
  IProcedimentoMedicoRepository repository;
  _ProcedimentoMedicoControllerBase(this.repository);

  GlobalKey<FormBuilderState> formBuildKey = GlobalKey<FormBuilderState>();
  TextEditingController titulo = TextEditingController();
  TextEditingController descLocal = TextEditingController();
  TextEditingController dtProcedimento = TextEditingController();
  TextEditingController dtRetorno = TextEditingController();
  TextEditingController descricao = TextEditingController();
  // TextEditingController idTipoProcedimento = TextEditingController();

  @observable
  var idTipoProcedimento;

  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  @observable
  var listProcedimentos = ObservableList();

  @observable
  var listTipoProcedimentos = ObservableList();

  @observable
  GetProcedimentoMedicoModel paramsRoute;

  @action
  Future<void> submitForm(BuildContext context) async {
    if (formBuildKey.currentState.saveAndValidate()) {
      if (paramsRoute != null && paramsRoute.id > 0) {
        editProcedimento(context);
      } else {
        saveProcedimento(context);
      }
    } else {
      return null;
    }
  }

  @action
  Future<void> saveProcedimento(BuildContext context) async {
    Map<String, dynamic> params = {
      'titulo': titulo.text,
      'descLocal': descLocal.text,
      'dtProcedimento': dtProcedimento.text,
      'descricao': descricao.text,
      'idTipoProcedimento': idTipoProcedimento.id,
      'dtRetorno': dtRetorno.text == '' ? null : dtRetorno.text
    };
    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.cadastroProcedimentoMedico(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Procedimento Médico cadastrado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.none..value = e;
      showFlushBar(
          message: 'Erro ao cadastrar Procedimento Médico!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future<void> editProcedimento(BuildContext context) async {
    Map<String, dynamic> params = {
      'id': paramsRoute.id,
      'titulo': titulo.text,
      'descLocal': descLocal.text,
      'dtProcedimento': dtProcedimento.text,
      'descricao': descricao.text,
      'idTipoProcedimento': idTipoProcedimento.id,
      'dtRetorno': dtRetorno.text
    };
    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.editProcedimentoMedico(body);
      var values = GetProcedimentoMedicoModel.fromJson(procedimento);
      if (values != null) {
        titulo.text = values.titulo;
        descLocal.text = values.descLocal;
        dtProcedimento.text = values.dtProcedimento;
        dtRetorno.text = values.dtRetorno;
        descricao.text = values.descricao;
      }
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Procedimento Médico alterado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Procedimento Médico!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  getParamsRota(BuildContext context) {
    paramsRoute = ModalRoute.of(context).settings.arguments;
    if (paramsRoute != null && paramsRoute.id > 0) {
      titulo.text = paramsRoute.titulo;
      descLocal.text = paramsRoute.descLocal;
      dtProcedimento.text = paramsRoute.dtProcedimento;
      dtRetorno.text = paramsRoute.dtRetorno;
      descricao.text = paramsRoute.descricao;
    }
  }

  @action
  Future getProcedimentos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var procedimentos = await repository.getProcedimentoMedico;
      listProcedimentos.clear();
      procedimentos.forEach((value) => listProcedimentos.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getTipoProcedimentos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var listaTipos = await repository.getTipoProcedimentoMedico;
      listTipoProcedimentos.clear();
      listaTipos.forEach((value) => listTipoProcedimentos.add(value));
      getParamsRota(context);
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Tipos de Procedimentos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  resetStatus() {
    status = RegistroStatusRequest.success;
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
