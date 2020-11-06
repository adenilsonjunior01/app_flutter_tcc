import 'package:app_tcc/app/modules/home/models/procedimentos_geral_model.dart';
import 'package:app_tcc/app/modules/home/models/quantitativo_model.dart';
import 'package:app_tcc/app/modules/home/repositories/interfaces/home_repository_interface.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/native_imp.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_repository.g.dart';

@Injectable()
class HomeRepository extends Disposable implements IHomeRepository {
  final Dio client;

  HomeRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  // TODO: implement getDadosProcedimentosGeral
  Future get getDadosProcedimentosGeral async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/dashboard/procedimentos');
      var values = ProcedimentosGeralModel.fromJson(response.data);
      return values;
    } catch (e) {
      return e;
    }
  }

  @override
  // TODO: implement getProcedimentosUltimosMeses
  Future get getProcedimentosUltimosMeses async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.get('${URL_API}/dashboard/procedimentos/ultimoMes');
      return response.data;
    } catch (e) {
      return e;
    }
  }

  @override
  // TODO: implement getQuantitativo
  Future get getQuantitativo async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/dashboard/quantitativo');
      var values = QuantitativoModel.fromJson(response.data);
      return values;
    } catch (e) {
      return e;
    }
  }
}
