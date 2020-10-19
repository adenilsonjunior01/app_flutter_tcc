import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'interfaces/profile_repository_interface.dart';

part 'profile_repository.g.dart';

@Injectable()
class ProfileRepository implements IProfileRepository {
  final Dio client;

  ProfileRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  Future fetchPost() async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  // TODO: implement dadosUsuario
  Future get dadosUsuario => throw UnimplementedError();

  @override
  Future<CreateUserModel> editUser(data) async {
    // TODO: implement editUser
    try {
      var response = await client.put('${URL_API}/user', data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
