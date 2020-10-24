import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';

part 'register_user_repository.g.dart';

@Injectable()
class RegisterUserRepository extends Disposable {
  final Dio client;

  RegisterUserRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  Future<dynamic> registerNewUser(data) async {
    try {
      var response = await client.post('${URL_API}/user', data: data);
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
