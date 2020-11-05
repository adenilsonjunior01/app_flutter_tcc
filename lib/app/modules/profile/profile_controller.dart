import 'dart:convert';

import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/profile/profile_status_request.dart';
import 'package:app_tcc/app/modules/profile/repositories/profile_repository.dart';
import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
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
  var perfil = ObservableList();

  @observable
  var listProcedimentos = ObservableList();

  @observable
  var listDadosMedicos = ObservableList();

  @observable
  ProfileStatusRequest status = ProfileStatusRequest.none;
  ProfileStatusRequest status2 = ProfileStatusRequest.none;

  @action
  Future jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    perfil.clear();
    for (var i = 0; i < user.perfis.length; i++) {
      perfil.add(user.perfis[i]);
    }
    users = user.nome;
    email = user.sub;
    firstLetter = users[0].toUpperCase();
  }

  @action
  Future editUser(BuildContext context) async {
    Map<String, dynamic> params = {
      'email': null,
      'nome': nameUser.text != '' ? nameUser.text : '',
      'dtNascimento': null,
      'sexo': null,
      'senha': null,
      'telefone': telUser.text != '' ? telUser.text : null
    };

    var body = jsonEncode(params);
    status = ProfileStatusRequest.loading;
    try {
      final user = await repository.editUser(body);
      status = ProfileStatusRequest.success..value = user;
      clearInputDesMedicamento();
      showFlushBar(
          message: 'Usuário alterado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = ProfileStatusRequest.success..value = e;
      showFlushBar(
          message: 'Erro ao editar Usuário!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  clearInputDesMedicamento() {
    nameUser.text = '';
    telUser.text = '';
  }

  @action
  Future getProcedimentosMedicos(BuildContext context) async {
    status = ProfileStatusRequest.loading;
    try {
      var procedimentos = await repository.getProcedimentosMedicos;
      listProcedimentos.clear();
      procedimentos.forEach((value) => listProcedimentos.add(value));
      getDadosMedicos(context);
    } catch (e) {
      status2 = ProfileStatusRequest.error;
      getDadosMedicos(context);
      showFlushBar(
          message: 'Nenhum registro de Procedimentos Médicos encontrado!',
          title: 'Oops!',
          type: 'warning',
          context: context);
    }
  }

  @action
  deleteProcedimentoMedico(int id, BuildContext context) async {
    status = ProfileStatusRequest.loading;
    try {
      var procedimento = await repository.deteleProcedimentoMedico(id);
      if (procedimento == 200 || procedimento == 204) {
        status = ProfileStatusRequest.success;
        getProcedimentosMedicos(context);
        showFlushBar(
            message: 'Procedimento Médico excluído com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
      }
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao excluir Procedimento Médico!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getDadosMedicos(BuildContext context) async {
    status = ProfileStatusRequest.loading;
    try {
      var tipos = await repository.getDadosMedicos;
      listDadosMedicos.clear();
      // tipos.forEach((value) => listDadosMedicos.add(value));
      listDadosMedicos.add(tipos);
      status = ProfileStatusRequest.success;
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  showFlushBar(
      {String message, String type, String title, BuildContext context}) {
    switch (type) {
      case 'success':
        {
          FlushbarHelper.createSuccess(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'error':
        {
          FlushbarHelper.createError(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'warning':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'info':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      default:
        {
          Flushbar(
            title: title,
            message: message,
            duration: Duration(seconds: 4),
          )..show(context);
          break;
        }
    }
  }
}
