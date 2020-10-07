import 'package:mobx/mobx.dart';
part 'item_model.g.dart';

class ItemModel = _ItemModelBase with _$ItemModel;

abstract class _ItemModelBase with Store {
  _ItemModelBase({this.title = '', this.check = false, this.tipo});

  @observable
  String title;

  @observable
  bool check;

  @observable
  int tipo;

  @action
  setTitle(String value) => title = value;

  @action
  setChcek(bool value) => check = value;

  @action
  setTipo(int value) => tipo = value;

  @action
  getTitle() => title;
}
