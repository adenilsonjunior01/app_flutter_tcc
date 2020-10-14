import 'dart:convert';

import 'package:app_tcc/app/modules/registros/interfaces/medicamento_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'medicamento_repository.g.dart';

@Injectable()
class MedicamentoRepository extends Disposable
    implements IMedicamentoRepository {
  final Dio client;

  MedicamentoRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<Medicamentos> registerNewMedicamento(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/medicamentos', data: data);
      var values = response.data[0];
      var convert = Medicamentos.fromJson(values);
      return convert;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future get getMedicamentoFuture async {
// TODO: implement getMedicamentoFuture
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
  Future deleteMedicamento(id) async {
    // TODO: implement deleteMedicamento
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.delete('${URL_API}/medicamentos/${id}');
      return response.statusCode;
    } on DioError catch (e) {}
  }

  @override
  Future<void> editMedicamento(data) async {
    // TODO: implement editMedicamento
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/medicamentos', data: data);
      return response.data;
    } on DioError catch (e) {}
  }
}
