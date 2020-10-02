import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'doenca_cronica_controller.g.dart';

@Injectable()
class DoencaCronicaController = _DoencaCronicaControllerBase
    with _$DoencaCronicaController;

abstract class _DoencaCronicaControllerBase with Store {
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
