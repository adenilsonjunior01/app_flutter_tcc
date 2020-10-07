import 'package:mobx/mobx.dart';
part 'item_medicamento_model.g.dart';

class ItemMedicamentoModel = _ItemMedicamentoModelBase
    with _$ItemMedicamentoModel;

abstract class _ItemMedicamentoModelBase with Store {
  _ItemMedicamentoModelBase({this.descricao = '', this.check = false});

  @observable
  String descricao;

  @observable
  bool check;

  @action
  setDescricao(String value) => descricao = value;

  @action
  setChcek(bool value) => check = value;

  @action
  getDescricao() => descricao;
}
