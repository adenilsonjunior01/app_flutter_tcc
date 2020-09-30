import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'doenca_cronica_controller.g.dart';

@Injectable()
class DoencaCronicaController = _DoencaCronicaControllerBase
    with _$DoencaCronicaController;

abstract class _DoencaCronicaControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }
}
