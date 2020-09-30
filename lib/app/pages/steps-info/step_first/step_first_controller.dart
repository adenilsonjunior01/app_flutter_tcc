import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'step_first_controller.g.dart';

@Injectable()
class StepFirstController = _StepFirstControllerBase with _$StepFirstController;

abstract class _StepFirstControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  navegateSecondPage(BuildContext context) {
    Navigator.pushNamed(context, '/second');
  }

  @action
  skipStep(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }
}
