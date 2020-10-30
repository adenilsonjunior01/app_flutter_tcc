import 'package:app_tcc/app/modules/login/models/user_auth_model.dart';
import 'package:app_tcc/app/modules/login/models/user_login_model.dart';
import 'package:app_tcc/app/shared/custom_dio/custom_dio.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_login_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'auth_repository.g.dart';

@Injectable()
class AuthRepository extends Disposable {
  // CustomDio client = CustomDio(url: LOGIN_API);
  final Dio client;

  AuthRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorLoginDio());
  }

  Future authentication(data) async {
    UserAuthModel credentials;
    try {
      var response = await client.post('${LOGIN_API}/login', data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
