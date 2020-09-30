import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'step_second_controller.g.dart';

@Injectable()
class StepSecondController = _StepSecondControllerBase
    with _$StepSecondController;

abstract class _StepSecondControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  navegateLoginPage(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @action
  skipStep(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }
}
