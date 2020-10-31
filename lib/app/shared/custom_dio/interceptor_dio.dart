import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InterceptorDio extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) async {
    print("REQUEST[${options.method}] => PATH: ${options.path}");
    return options;
  }

  @override
  Future onResponse(Response response) {
    // TODO: implement onResponse
    print("RESPONSE[${response.statusCode}] => PATH: ${response.request.path}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    // TODO: implement onError
    print("ERROR[${err.response.statusCode}] => PATH: ${err.request.path}");
    if (err.response.statusCode == 403) {
      // Modular.link.pushNamed('/login');
    }
    return super.onError(err);
  }
}
