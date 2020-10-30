import 'package:app_tcc/app/modules/registros/interfaces/doenca_cronica_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'doenca_cronica_repository.g.dart';

@Injectable()
class DoencaCronicaRepository extends Disposable
    implements IDoencaCronicaRepository {
  final Dio client;

  DoencaCronicaRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future deleteDoencaCronica(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.delete('${URL_API}/doencaCronica/${id}');
      return response.statusCode;
    } on DioError catch (e) {}
  }

  @override
  Future<void> editDoencaCronica(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/doencaCronica', data: data);
      return response.data;
    } on DioError catch (e) {}
  }

  @override
  Future get getDoencaCronicaFuture async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/dadosMedicos');
      var parser = RegistrosModel.fromJson(response.data);
      return parser;
    } on DioError catch (e) {
      // if (e.response.statusCode == 403) {
      //   return Modular.link.pushNamed('/login');
      // }
    }
  }

  @override
  Future<DoencasCronicas> registerNewDoencaCronica(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/doencaCronica', data: data);
      var values = response.data[0];
      var convert = DoencasCronicas.fromJson(values);
      return convert;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
