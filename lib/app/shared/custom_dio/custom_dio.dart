import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:dio/dio.dart';

class CustomDio {
  final Dio client;

  String url;

  CustomDio({this.client, this.url}) {
    client.options.baseUrl = url;
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
    client.options.connectTimeout = 5000;
  }
}
