import 'dart:async';

import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
import 'package:flutter_modular/flutter_modular.dart';

abstract class IProfileRepository implements Disposable {
  Future get dadosUsuario;
  Future<CreateUserModel> editUser(dynamic data);
}
