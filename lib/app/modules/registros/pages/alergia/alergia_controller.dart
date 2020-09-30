import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'alergia_controller.g.dart';

@Injectable()
class AlergiaController = _AlergiaControllerBase with _$AlergiaController;

abstract class _AlergiaControllerBase with Store {
  @observable
  int value = 0;
  String tipoAlergia = 'Tipo 1';
  @action
  void increment() {
    value++;
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }
}
