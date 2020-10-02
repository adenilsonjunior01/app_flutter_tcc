import 'dart:convert';

import 'package:app_tcc/app/modules/login/models/usuario.dart';
import 'package:dio/dio.dart';

class LoginApi {
  static Future<Usuario> login(String user, String password) async {
    Dio dio = Dio();

    String URL_API = "";
    var usuario;
    Map paramsLogin = {"username": user, "password": password};

    var header = {"Content-type": "application/json"};
    var body = json.encode(paramsLogin);
    var response =
        await dio.post(URL_API, data: body, options: Options(headers: header));

    if (response.statusCode == 200) {
      Map mapResponse = json.decode(response.data);
      usuario = Usuario.fromJson(mapResponse);
    } else {
      usuario = null;
    }
    return usuario;
  }
}
