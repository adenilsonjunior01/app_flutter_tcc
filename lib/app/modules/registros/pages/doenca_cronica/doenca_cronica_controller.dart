import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
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
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
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

  @action
  getDoencasCronicas(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var doencaCronica = await repository.getDoencaCronicaFuture;
      doencaCronica = doencaCronica.doencasCronicas;
      listDoencaCronica.clear();
      doencaCronica.forEach((e) => listDoencaCronica.add(e));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
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
      } else {
        getDoencasCronicas(context);
      }
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  @action
  editItem(DoencasCronicas item) async {
    bool formValido = formKey.currentState.validate();
    if (!formValido) {
      return;
    }
    try {
      var newValue = [
        {"id": item.id, "desc": item.descDoencaCronica}
      ];
      var valueParser = jsonEncode(newValue);
      status = RegistroStatusRequest.loading;
      var response = await repository.editDoencaCronica(valueParser);
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
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
}
