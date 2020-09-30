import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'resetar_senha_controller.g.dart';

@Injectable()
class ResetarSenhaController = _ResetarSenhaControllerBase
    with _$ResetarSenhaController;

abstract class _ResetarSenhaControllerBase with Store {
  @observable
  int value = 0;

  final email = TextEditingController();
  @action
  void increment() {
    value++;
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }
}
