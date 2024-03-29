import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/models/dados_medicos_model.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/profile_repository_interface.dart';

part 'profile_repository.g.dart';

@Injectable()
class ProfileRepository implements IProfileRepository {
  final Dio client;

  ProfileRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  // TODO: implement dadosUsuario
  Future get dadosUsuario => throw UnimplementedError();

  @override
  // TODO: implement getDadosProcedimentosGeral
  Future get getDadosProcedimentosGeral async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/dashboard/procedimentos');
      // var values = ProcedimentosGeralModel.fromJson(response.data);
      return response.data;
    } catch (e) {
      return e;
    }
  }

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

  @override
  Future get getProcedimentosMedicos async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/procedimentoMedico');
      var values = response.data
          .map((value) => GetProcedimentoMedicoModel.fromJson(value));
      return values;
    } catch (e) {
      return e;
    }
  }

  @override
  Future deteleProcedimentoMedico(id) async {
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
}
