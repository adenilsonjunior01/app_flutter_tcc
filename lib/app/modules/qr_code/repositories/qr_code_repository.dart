import 'package:app_tcc/app/modules/qr_code/models/qr_code_token_model.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:app_tcc/app/modules/registros/models/procedimento_medico_model.dart';
import 'package:app_tcc/app/shared/custom_dio/interceptor_dio.dart';
import 'package:app_tcc/app/shared/models/dados_medicos_model.dart';
import 'package:app_tcc/app/shared/utils/constants.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'interfaces/qr_code_repository_interface.dart';

part 'qr_code_repository.g.dart';

@Injectable()
class QrCodeRepository implements IQrCodeRepository {
  final DioForNative client;

  QrCodeRepository(this.client) {
    client.options.headers = {"Content-type": "application/json"};
    client.interceptors.add(InterceptorDio());
  }

  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  // TODO: implement getMeuQrCode
  Future get getMeuQrCode async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.get('${URL_API}/QRCode');
      var values = QrCodeTokenModel.fromJson(response.data);
      // persiste o token do Qr Code no SharedPreferences(fica disponível na aplicação inteira)
      prefs.setString('qr_code_token', values.token);
      return values;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future getDadosMedicosQrCode(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.post('${URL_API}/QRCode/dadosMedicos', data: data);
      var values = DadosMedicosModel.fromJson(response.data);
      return values;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future getProcedimentosMedicosQrCode(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/QRCode/procedimentosMedicos',
          data: data);
      var values = GetProcedimentoMedicoModel.fromJson(response.data);
      return values;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future cadastroAlergia(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client.post('${URL_API}/QRCode/alergia', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future cadastroDoencaCronica(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.post('${URL_API}/QRCode/doencaCronica', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future cadastroMedicamento(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response =
          await client.post('${URL_API}/QRCode/medicamento', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }

  @override
  Future cadastroProcedimentoMedico(data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    client.options.headers = {"Authorization": "Bearer ${token}"};
    try {
      var response = await client
          .post('${URL_API}/QRCode/addProcedimentosMedicos', data: data);
      return response.data;
    } on DioError catch (e) {
      return e;
    }
  }
}
