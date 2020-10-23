import 'package:dio/dio.dart';

class InterceptorLoginDio extends InterceptorsWrapper {
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
    return super.onError(err);
  }
}
