import 'package:app_tcc/app/modules/registros/interfaces/procedimento_medico_interface.dart';
import 'package:app_tcc/app/modules/registros/models/tipo_procedimento_model.dart';
import 'package:app_tcc/app/modules/registros/models/procedimento_medico_model.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'procedimento_medico_repository.g.dart';

@Injectable()
class ProcedimentoMedicoRepository extends Disposable
    implements IProcedimentoMedicoRepository {
  final Dio client;

  ProcedimentoMedicoRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future cadastroProcedimentoMedico(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.post('${URL_API}/procedimentoMedico', data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future deleteProcedimentoMedico(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.delete('${URL_API}/procedimentoMedico/${id}');
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future editProcedimentoMedico(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.put('${URL_API}/procedimentoMedico', data: data);
      return response.data;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future get getProcedimentoMedico async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/procedimentoMedico');
      var values = GetProcedimentoMedicoModel.fromJson(response.data);
      return values;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  Future get getTipoProcedimentoMedico async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/procedimentoMedico/tipos');
      var values =
          response.data.map((value) => TipoProcedimentoModel.fromJson(value));
      return values;
    } on DioError catch (e) {
      throw (e.message);
    }
  }
}
