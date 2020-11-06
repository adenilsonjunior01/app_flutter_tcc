import 'package:app_tcc/app/modules/registros/interfaces/meus_dados_medicos_interface.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'meus_dados_medicos_repository.g.dart';

@Injectable()
class MeusDadosMedicosRepository extends Disposable
    implements IMeusDadosMedicosInterface {
  final Dio client;

  MeusDadosMedicosRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future dadosMedicos(data) async {
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
  Future get getTiposSanguineo async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/tipoSanguineo');
      var datas = response.data;
      var parser = datas.map((value) => TipoSanguineo.fromJson(value));
      return parser;
    } on DioError catch (e) {
      return e;
    }
  }
}
