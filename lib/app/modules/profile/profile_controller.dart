import 'dart:convert';

import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/profile/profile_status_request.dart';
import 'package:app_tcc/app/modules/profile/repositories/profile_repository.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  TextEditingController nameUser = TextEditingController();
  TextEditingController telUser = TextEditingController();

  final ProfileRepository repository;

  _ProfileControllerBase(this.repository);

  @observable
  String users = '';

  @observable
  String firstLetter = '';

  @observable
  String email = '';

  @observable
  var listProcedimentos = ObservableList();

  @observable
  ProfileStatusRequest status = ProfileStatusRequest.none;

  @action
  Future jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    users = user.nome;
    email = user.sub;
    firstLetter = users[0].toUpperCase();
    print(email);
  }

  @action
  Future editUser(BuildContext context) async {
    Map<String, dynamic> params = {
      'email': '',
      'nome': nameUser.text != '' ? nameUser.text : '',
      'dtNascimento': '',
      'sexo': '',
      'senha': '',
      'telefone': telUser.text != '' ? telUser.text : ''
    };

    var body = jsonEncode(params);
    status = ProfileStatusRequest.loading;
    try {
      final user = await repository.editUser(body);
      status = ProfileStatusRequest.success..value = user;
      clearInputDesMedicamento();
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
    }
  }

  @action
  clearInputDesMedicamento() {
    nameUser.text = '';
    telUser.text = '';
  }

  @action
  Future getProcedimentosMedicos() async {
    status = ProfileStatusRequest.loading;
    try {
      var procedimentos = await repository.getProcedimentosMedicos;
      listProcedimentos.clear();
      procedimentos.forEach((value) => listProcedimentos.add(value));
      status = ProfileStatusRequest.success;
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
    }
  }

  @action
  deleteProcedimentoMedico(int id) async {
    status = ProfileStatusRequest.loading;
    try {
      var procedimento = await repository.deteleProcedimentoMedico(id);
      if (procedimento == 200 || procedimento == 204) {
        getProcedimentosMedicos();
      }
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
    }
  }
}
