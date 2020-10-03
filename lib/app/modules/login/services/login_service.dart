import 'dart:convert';

import 'package:app_tcc/app/modules/login/models/user_auth_model.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';

class LoginApi {
  static Future<UserAuthModel> login(String user, String password) async {
    Dio dio = Dio();

    String URL_API = LOGIN_API;
    var usuario;
    // Map paramsLogin = {"email": user, "senha": password};
    Map paramsLogin = {
      "email": 'felixbastos.lucas@gmail.com',
      "senha": "asdqwe123"
    };

    var header = {"Content-type": "application/json"};
    var body = json.encode(paramsLogin);

    try {
      // faz a request pro end-point de autenticação
      var response = await dio.post(URL_API,
          data: body, options: Options(headers: header));

      if (response.statusCode == 200) {
        Map mapResponse = response.data;
        usuario = UserAuthModel.fromJson(mapResponse);
      } else {
        usuario = null;
      }
      return usuario;
    } catch (e) {
      print("[ERROR] => ${e}, [STATUS] => ${e.response.statusCode}");
    }
  }
}
