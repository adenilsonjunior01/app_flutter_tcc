import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'registros_controller.g.dart';

@Injectable()
class RegistrosController = _RegistrosControllerBase with _$RegistrosController;

abstract class _RegistrosControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
