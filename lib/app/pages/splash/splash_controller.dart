import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'splash_controller.g.dart';

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  @action
  Future<void> verificaPrimeiroAcesso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final acesso = prefs.getBool('primeiroAcesso');
    if (acesso == true && acesso != null) {
      // Modular.link.pushNamed('/login');
      Modular.to.pushReplacementNamed('/login');
    } else {
      setPrimeiroAcesso();
      Modular.to.pushReplacementNamed('/first');
    }
  }

  @action
  Future<void> setPrimeiroAcesso() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('primeiroAcesso', true);
  }
}
