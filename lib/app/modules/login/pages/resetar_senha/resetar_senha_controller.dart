import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'resetar_senha_controller.g.dart';

@Injectable()
class ResetarSenhaController = _ResetarSenhaControllerBase
    with _$ResetarSenhaController;

abstract class _ResetarSenhaControllerBase with Store {
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();

  TextEditingController email = TextEditingController();
  TextEditingController codigoVerificacao = TextEditingController();

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  @action
  verifyAction(BuildContext context) {
    if (email.text.trim().isNotEmpty &&
        codigoVerificacao.text.trim().isNotEmpty) {
      final snackbar = SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Preencha apenas um campo do formulário.'),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    } else if (email.text.trim().isNotEmpty &&
        codigoVerificacao.text.trim().isEmpty) {
      requestResetPassword();
    } else if (codigoVerificacao.text.trim().isNotEmpty &&
        email.text.trim().isEmpty) {
      requestConfirmCode();
    } else {
      return null;
    }
  }

  @action
  Future requestResetPassword() async {}

  @action
  Future requestConfirmCode() async {}
}
