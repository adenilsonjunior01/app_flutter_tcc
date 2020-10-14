import 'package:app_tcc/app/modules/registros/interfaces/alergia_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'alergia_repository.g.dart';

@Injectable()
class AlergiaRepository extends Disposable implements IAlergiaRepostory {
  final Dio client;

  AlergiaRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future deleteAlergia(id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.delete('${URL_API}/alergia/${id}');
      return response.statusCode;
    } on DioError catch (e) {}
  }

  @override
  Future<void> editAlergia(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.put('${URL_API}/alergia', data: data);
      return response.data;
    } on DioError catch (e) {}
  }

  @override
  // TODO: implement getAlergia
  Future get getAlergia async {
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
  Future<Alergias> registerNewAlergia(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/alergia', data: data);
      var values = response.data[0];

      var convert = Alergias.fromJson(values);
      return convert;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  @override
  // TODO: implement getTiposAlergia
  Future get getTiposAlergia async {
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
