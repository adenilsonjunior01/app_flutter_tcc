import 'dart:convert';

import 'package:app_tcc/app/modules/registros/models/item_medicamento_model.dart';
import 'package:app_tcc/app/modules/registros/models/medicamento_model.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/repositories/medicamento_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  GlobalKey formKey = GlobalKey<FormState>();
  TextEditingController descMedicamento = TextEditingController();
  MedicamentoRepository repository;

  @observable
  var listItems = ObservableList<ItemMedicamentoModel>();

  @action
  addItem({item}) {
    final item = ItemMedicamentoModel(descricao: descMedicamento.text);
    listItems.add(item);
    descMedicamento.text = "";
  }

  @action
  removeItem(ItemMedicamentoModel model) {
    listItems.removeWhere((item) => item.descricao == model.descricao);
  }

  @action
  addLastItem(ItemMedicamentoModel item) {
    listItems.add(item);
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  @action
  Future<void> submitForm(BuildContext context) async {
    // POR VALIDAÇÃO NO INPUT
    addItem();
    MedicamentoModel medicamentoModel;
    var aux = listItems.toList().map((e) => toJson2(e.descricao)).toList();
    String body = jsonEncode(aux);

    print('>>>>>>${body}');

    status = RegistroStatusRequest.loading;

    try {
      final medicamento = await repository.registerNewMedicamento(body);
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
    }
  }

  Map toJson2(String desc) {
    return {'desc': desc};
  }
}
