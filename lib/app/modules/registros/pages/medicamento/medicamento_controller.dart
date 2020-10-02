import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'medicamento_controller.g.dart';

@Injectable()
class MedicamentoController = _MedicamentoControllerBase
    with _$MedicamentoController;

abstract class _MedicamentoControllerBase with Store {
  @observable
  int value = 0;

  final formKey = GlobalKey<FormState>();
  final TextEditingController descMedicamento = TextEditingController();

  @observable
  ObservableList<ItemModel> listItems = ObservableList<ItemModel>();

  @action
  addItem({item}) {
    final ItemModel item = ItemModel(title: descMedicamento.text);
    listItems.add(item);
    descMedicamento.text = "";
  }

  @action
  removeItem(ItemModel model) {
    listItems.removeWhere((item) => item.title == model.title);
  }

  @action
  addLastItem(ItemModel item) {
    listItems.add(item);
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }
}
