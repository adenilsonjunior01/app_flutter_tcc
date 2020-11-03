import 'package:app_tcc/app/modules/registros/interfaces/dados_medicos_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/tipo_sanguineo_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/models/dados_medicos_model.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dados_medicos_repository.g.dart';

@Injectable()
class DadosMedicosRepository extends Disposable
    implements IDadosMedicosRepository {
  final Dio client;

  DadosMedicosRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future get getTipoSanguineo async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/tipoSanguineo');
      var values =
          response.data.map((value) => TipoSanguineoModel.fromJson(value));
      return values;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  // TODO: implement dadosMedicos
  Future get getDadosMedicos async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/dadosMedicos');
      var values = DadosMedicosModel.fromJson(response.data);
      // var newValues = DoencasCronicas.fromJson(values.doencasCronicas);
      return values;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future editDadosMedicos(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/dadosMedicos', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future editAlergia(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/dadosMedicos', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future editDoencaCronica(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/dadosMedicos', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future editMedicamento(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/dadosMedicos', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future get getTipoAlergias async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/alergia');
      var datas = response.data;
      var parser = datas.map((value) => TipoAlergia.fromJson(value));
      return parser;
    } on DioError catch (e) {}
  }
}
