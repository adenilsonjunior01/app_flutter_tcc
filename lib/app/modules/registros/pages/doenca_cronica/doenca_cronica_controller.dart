import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../registro_status_request.dart';

part 'doenca_cronica_controller.g.dart';

@Injectable()
class DoencaCronicaController = _DoencaCronicaControllerBase
    with _$DoencaCronicaController;

abstract class _DoencaCronicaControllerBase with Store {
  _DoencaCronicaControllerBase(this.repository);

  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  var formKey = GlobalKey<FormState>();
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  TextEditingController descDoencaCronica = TextEditingController();
  TextEditingController newdescDoencaCronica = TextEditingController();
  IDoencaCronicaRepository repository;

  @observable
  DoencasCronicas oldValueMedicamento;

  @observable
  var listDoencaCronica = ObservableList<DoencasCronicas>();

  @observable
  bool isEmptyList = false;

  @action
  Future<void> submitForm(BuildContext context) async {
    if (formBuilderKey.currentState.saveAndValidate()) {
      var body = toJson2(descDoencaCronica.text);
      status = RegistroStatusRequest.loading;
      try {
        final jsonConvert = jsonEncode(body);
        final medicamento =
            await repository.registerNewDoencaCronica(jsonConvert);
        listDoencaCronica.add(medicamento);
        status = RegistroStatusRequest.success;
        _clearInputDesMedicamento();
        getDoencasCronicas(context);
        showFlushBar(
            message: 'Doença Crônica cadastrada com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao cadastrar Doenças Crônicas!',
            title: 'Oops!',
            type: 'error',
            context: context);
      }
    } else {
      return null;
    }
  }

  toJson2(String desc) {
    return [
      {'descDoenca': desc}
    ];
  }

  @action
  getDoencasCronicas(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var doencaCronica = await repository.getDoencaCronicaFuture;
      doencaCronica = doencaCronica.doencasCronicas;
      listDoencaCronica.clear();
      doencaCronica.forEach((e) => listDoencaCronica.add(e));
      if (listDoencaCronica.length == 0) {
        isEmptyList = false;
      } else {
        isEmptyList = true;
      }
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Doenças Crônicas!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  removeItem(item, BuildContext context) async {
    var medicamento = item.id;
    try {
      status = RegistroStatusRequest.loading;
      var response = await repository.deleteDoencaCronica(medicamento);
      if (response == 400 || response == 500) {
        listDoencaCronica.add(oldValueMedicamento);
        showFlushBar(
            message: 'Erro ao excluir Doença Crônica!',
            title: 'Oops!',
            type: 'error',
            context: context);
      } else {
        getDoencasCronicas(context);
        showFlushBar(
            message: 'Doença Crônica excluída com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
      }
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao excluir Doença Crônica!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  editItem(DoencasCronicas item, BuildContext context) async {
    bool formValido = formKey.currentState.validate();
    if (!formValido) {
      return;
    }
    try {
      var newValue = [
        {"id": item.id, "descDoenca": item.descDoenca}
      ];
      var valueParser = jsonEncode(newValue);
      status = RegistroStatusRequest.loading;
      var response = await repository.editDoencaCronica(valueParser);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Doença Crônica alterada com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Doença Crônica!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
    _clearInputDesMedicamento();
  }

  _clearInputDesMedicamento() {
    descDoencaCronica.text = '';
    newdescDoencaCronica.text = '';
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
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
