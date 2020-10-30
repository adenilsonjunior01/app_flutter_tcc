import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/medicamento_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'medicamento_controller.g.dart';

@Injectable()
class MedicamentoController = _MedicamentoControllerBase
    with _$MedicamentoController;

abstract class _MedicamentoControllerBase with Store {
  _MedicamentoControllerBase(this.repository);
  @observable
  int value = 0;

  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  var formKey = GlobalKey<FormState>();
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  TextEditingController descMedicamento = TextEditingController();
  TextEditingController newDescMedicamento = TextEditingController();
  IMedicamentoRepository repository;

  @observable
  Medicamentos oldValueMedicamento;

  @observable
  var listMedicamento = ObservableList<Medicamentos>();

  @observable
  var medicamentos;

  @action
  removeItem(item, BuildContext context) async {
    var medicamento = item.id;
    try {
      status = RegistroStatusRequest.loading;
      var response = await repository.deleteMedicamento(medicamento);
      if (response == 400 || response == 500) {
        listMedicamento.add(oldValueMedicamento);
        showFlushBar(
            message: 'Erro ao excluir medicamento!',
            title: 'Oops!',
            type: 'error',
            context: context);
      } else {
        getMedicamentos(context);
        showFlushBar(
            message: 'Medicamento excluído com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
      }
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  @action
  setOldValueMedicamento() {
    listMedicamento.clear();
    medicamentos.forEach((e) => listMedicamento.add(e));
  }

  @action
  editItem(Medicamentos item, BuildContext context) async {
    bool formValido = formKey.currentState.validate();
    if (!formValido) {
      return;
    }

    try {
      var newValue = [
        {"id": item.id, "desc": item.descMedicamento}
      ];
      var valueParser = jsonEncode(newValue);
      status = RegistroStatusRequest.loading;
      var response = await repository.editMedicamento(valueParser);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Medicamento editado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      showFlushBar(
          message: 'Erro ao editar medicamento!',
          title: 'Oops!',
          type: 'error',
          context: context);
      status = RegistroStatusRequest.error..value = e;
    }
    _clearInputDesMedicamento();
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  @action
  Future<void> submitForm(BuildContext context) async {
    if (formBuilderKey.currentState.saveAndValidate()) {
      var body = toJson2(descMedicamento.text);
      status = RegistroStatusRequest.loading;
      try {
        final jsonConvert = jsonEncode(body);
        final medicamento =
            await repository.registerNewMedicamento(jsonConvert);
        listMedicamento.add(medicamento);
        status = RegistroStatusRequest.success;
        showFlushBar(
            message: 'Medicamento cadastrado com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
        _clearInputDesMedicamento();
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao cadastrar medicamento!',
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
      {'desc': desc}
    ];
  }

  getMedicamentos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var medicamentos = await repository.getMedicamentoFuture;
      medicamentos = medicamentos.medicamentos;
      listMedicamento.clear();
      medicamentos.forEach((e) => listMedicamento.add(e));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar medicamentos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  _clearInputDesMedicamento() {
    descMedicamento.text = '';
    newDescMedicamento.text = '';
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
