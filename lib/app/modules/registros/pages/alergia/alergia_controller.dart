import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/alergia_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/shared/models/dados_medicos_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../registro_status_request.dart';

part 'alergia_controller.g.dart';

@Injectable()
class AlergiaController = _AlergiaControllerBase with _$AlergiaController;

abstract class _AlergiaControllerBase with Store {
  final desc = TextEditingController();
  final tipo = TextEditingController();
  _AlergiaControllerBase(this.repository);

  @observable
  var tipoAlergia;

  @observable
  var newTipoAlergia;

  @observable
  var listItems = ObservableList<ItemModel>();

  // -------------------------------------------------
  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  var formKey = GlobalKey<FormState>();
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> formBuilderKey2 = GlobalKey<FormBuilderState>();
  TextEditingController descAlergias = TextEditingController();
  TextEditingController newDescAlergias = TextEditingController();
  IAlergiaRepostory repository;

  @observable
  var listAlergias = ObservableList();

  @observable
  var listTiposAlergia = ObservableList();

  @action
  addItem({item}) {
    final item = ItemModel(title: desc.text, tipo: int.parse(tipo.text));
    listItems.add(item);
    desc.text = "";
  }

  @action
  removeItem(item, BuildContext context) async {
    var medicamento = item.id;
    try {
      status = RegistroStatusRequest.loading;
      var response = await repository.deleteAlergia(medicamento);
      getAlergias(context);
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  getAlergias(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var medicamentos = await repository.getAlergia;
      medicamentos = medicamentos.alergias;
      listAlergias.clear();
      medicamentos.forEach((value) => listAlergias.add(value));
      getTiposAlergia(context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  getTiposAlergia(BuildContext context) async {
    try {
      var tipos = await repository.getTiposAlergia;
      listTiposAlergia.clear();
      tipos.forEach((value) => listTiposAlergia.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  @action
  addLastItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  @action
  editItem(item, context) async {
    if (formBuilderKey2.currentState.saveAndValidate()) {
      try {
        var newValue = [
          {
            "id": item.id,
            "descAlergia": newDescAlergias.text,
            "idTipoAlergia": newTipoAlergia.id
          }
        ];
        var valueParser = jsonEncode(newValue);
        status = RegistroStatusRequest.loading;
        var response = await repository.editAlergia(valueParser);
        getAlergias(context);
        status = RegistroStatusRequest.success;
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
      }
      _clearInputDesMedicamento();
    } else {
      return null;
    }
  }

  @action
  Future<void> submitForm(BuildContext context) async {
    if (formBuilderKey.currentState.saveAndValidate()) {
      var parserTipo = tipoAlergia.id;

      var body = toJson2(descAlergias.text, parserTipo);
      status = RegistroStatusRequest.loading;
      try {
        final jsonConvert = jsonEncode(body);
        final medicamento = await repository.registerNewAlergia(jsonConvert);
        listAlergias.add(medicamento);
        status = RegistroStatusRequest.success;
        _clearInputDesMedicamento();
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
      }
    } else {
      return null;
    }
  }

  toJson2(desc, tipoId) {
    return [
      {'descAlergia': desc, 'idTipoAlergia': tipoId},
    ];
  }

  toJson3(tipo) {
    return {
      {'idTipoAlergia': tipo}
    };
  }

  _clearInputDesMedicamento() {
    descAlergias.text = '';
    newDescAlergias.text = '';
  }
}
