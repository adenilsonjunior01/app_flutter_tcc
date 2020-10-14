import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/jwt_token_model.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @observable
  String users;

  @action
  void increment() {
    value++;
  }

  @action
  Future jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    users = user.nome;

    print(user.nome);
  }

  @action
  logout() {
    Modular.link.pop();
  }
}
