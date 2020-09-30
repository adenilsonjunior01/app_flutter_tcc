import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final formKey = GlobalKey<FormState>();
  final nomeCompleto = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();
  String sexo = 'Masculino';
  final dtNascimento = TextEditingController();
  final password = TextEditingController();

  buildTextField(String label, TextEditingController controller,
      TextInputType type, String hint, bool o,
      {FormFieldValidator<String> validator, MaskTextInputFormatter mask}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.white, fontSize: 14),
      keyboardType: type,
      obscureText: o,
      inputFormatters: [mask],
      validator: validator,
      decoration: InputDecoration(
          // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          contentPadding: EdgeInsets.all(13),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(55)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white10)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.white70)),
    );
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }
}
