import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'medicamento_repository.g.dart';

@Injectable()
class MedicamentoRepository extends Disposable {
  final Dio client;

  MedicamentoRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
    client.options.connectTimeout = 5000;
  }

  Future<void> registerNewMedicamento(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/medicamentos', data: data);
      return response;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
