import 'dart:convert';

import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/modules/login/models/create_user_model.dart';
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
        'telefone': telefone.text
      };

      // CreateUserModel body = CreateUserModel.fromJson(params);
      var body = json.encode(params);
      status = LoginStatus.loading;

      try {
        final user = await repository.registerNewUser(body);
        status = LoginStatus.success..value = user;
        _resetInputsForm();
        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //   duration: Duration(seconds: 3),
        //   content: Text('Usuário criado com sucesso!'),
        // )
        // );
      } catch (e) {
        status = LoginStatus.error..value = e;
        // final snackbar = SnackBar(
        //   duration: Duration(seconds: 3),
        //   content: Text(
        //       'Desculpa, ocorreu um erro ao criar usuário, tente novamente.'),
        // );
        // Scaffold.of(context).showSnackBar(snackbar);
      }
      print(body);
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
