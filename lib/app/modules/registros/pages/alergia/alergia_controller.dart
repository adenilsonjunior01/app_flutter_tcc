import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'alergia_controller.g.dart';

@Injectable()
class AlergiaController = _AlergiaControllerBase with _$AlergiaController;

abstract class _AlergiaControllerBase with Store {
  final formKey = GlobalKey<FormState>();
  final TextEditingController desc = TextEditingController();
  final TextEditingController tipo = TextEditingController();

  String tipoAlergia = 'Tipo 1';

  @observable
  ObservableList<ItemModel> listItems = ObservableList<ItemModel>();

  @action
  addItem({item}) {
    final item = ItemModel(title: desc.text, tipo: int.parse(tipo.text));
    listItems.add(item);
    desc.text = "";
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
