import 'dart:convert';

import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
import 'package:app_tcc/app/modules/login/models/error_cadastro_array_model.dart';
import 'package:app_tcc/app/modules/login/models/error_cadastro_user_model.dart';
import 'package:app_tcc/app/modules/login/repositories/register_user_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

part 'cadastro_user_controller.g.dart';

@Injectable()
class CadastroUserController = _CadastroUserControllerBase
    with _$CadastroUserController;

var maskFormatter = new MaskTextInputFormatter(mask: null);

abstract class _CadastroUserControllerBase with Store {
  // Masck
  var maskFormatterDate = new MaskTextInputFormatter(mask: "##-##-####");
  var maskFormatterTel = new MaskTextInputFormatter(mask: "(##) # ####-####");
  final RegisterUserRepository repository;

  _CadastroUserControllerBase(this.repository);

  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  TextEditingController nome = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();
  String sexo = 'Masculino';
  String tipoSexo;
  TextEditingController dtNascimento = TextEditingController();
  TextEditingController senha = TextEditingController();

  @observable
  String messageRequest = '';

  @observable
  var messagesRequestErrors = ObservableList();

  @observable
  LoginStatus status = LoginStatus.none;

  Future<void> submitForm(BuildContext context) async {
    if (formBuilderKey.currentState.saveAndValidate()) {
      _verificaTipoSexo(sexo);
      Map<String, dynamic> params = {
        'email': email.text,
        'nome': nome.text,
        'dtNascimento': dtNascimento.text,
        'sexo': tipoSexo,
        'senha': senha.text,
        'telefone': telefone.text.split(" ").join("")
      };
      messagesRequestErrors.clear();
      messageRequest = '';

      // CreateUserModel body = CreateUserModel.fromJson(params);
      var body = json.encode(params);
      status = LoginStatus.loading;

      try {
        final user = await repository.registerNewUser(body);
        if (user.statusCode == 400) {
          var response2 = ErrorCadastroArrayModel.fromJson(user.data);
          if (response2.errors != null) {
            messagesRequestErrors.add(response2.errors[0]);
            messageRequest = null;
          } else {
            var response = ErrorCadastroUserModel.fromJson(user.data);
            messageRequest = response.message;
          }
          status = LoginStatus.error..value = user;
        } else {
          status = LoginStatus.success..value = user;
          _resetInputsForm();
        }
      } catch (e) {
        status = LoginStatus.error..value = e;
      }
    } else {
      return null;
    }
  }

  _verificaTipoSexo(String sexo) {
    if (sexo == 'Masculino') {
      tipoSexo = 'm';
    } else {
      tipoSexo = 'f';
    }
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  // Definição da valição do nome
  String validaNome(String text) {
    if (text.isEmpty) return "Digite seu nome completo";
    return null;
  }

  // Definição da valição do login
  String validaEmail(String text) {
    if (text.isEmpty) return "Digite seu e-mail";
    return null;
  }

  // Definição da valição do telefone
  String validaTelefone(String text) {
    if (text.isEmpty) return "Digite o telefone para contato";
    return null;
  }

  // Definição da valição do senha
  String validaSenha(String text) {
    if (text.isEmpty) return "Digite o senha";
    return null;
  }

  // Definição da valição do senha
  String validaDtNascimento(String text) {
    if (text.isEmpty) return "Digite sua data de nascimento";
    return null;
  }

  _resetInputsForm() {
    nome.text = '';
    email.text = '';
    dtNascimento.text = '';
    telefone.text = '';
    senha.text = '';
  }
}
