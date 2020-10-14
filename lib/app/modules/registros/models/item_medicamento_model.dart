import 'package:mobx/mobx.dart';
part 'item_medicamento_model.g.dart';

class ItemMedicamentoModel = _ItemMedicamentoModelBase
    with _$ItemMedicamentoModel;

abstract class _ItemMedicamentoModelBase with Store {
  _ItemMedicamentoModelBase({this.descMedicamento = '', this.id = 0});

  @observable
  String descMedicamento;

  @observable
  int id;

  @action
  setDescricao(String value) => descMedicamento = value;

  @action
  setChcek(int value) => id = value;

  @action
  getDescricao() => descMedicamento;
}
