import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'edit_profile_controller.g.dart';

@Injectable()
class EditProfileController = _EditProfileControllerBase
    with _$EditProfileController;

abstract class _EditProfileControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
