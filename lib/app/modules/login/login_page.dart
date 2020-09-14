import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.fromLTRB(17, 130, 17, 0),
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/images/logo-roxo.png',
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
                  child: Text("Olá, por favor faça o login",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF171f46),
                        fontSize: 28,
                      )),
                ),
                Padding(
                  child: buildTextField(
                      "Endereço de E-mail",
                      controller.user,
                      TextInputType.emailAddress,
                      "Digite seu e-mail aqui",
                      false,
                      validator: _validaLogin),
                  padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
                ),
                Padding(
                  child: buildTextField("Senha", controller.password,
                      TextInputType.text, "Digite sua senha aqui", true,
                      validator: _validaSenha),
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: ButtonTheme(
                        minWidth: 1000,
                        child: _raisedButton("Enviar", 0xFF5A5DCB, context))),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Text(
                        "Precisa de uma conta NomeApp?",
                        style: TextStyle(fontSize: 16),
                      ),
                      FlatButton(
                        onPressed: () {},
                        child: Text("Crie a sua conta aqui",
                            style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ));
  }

  buildTextField(String label, TextEditingController controller,
      TextInputType type, String hint, bool o,
      {FormFieldValidator<String> validator}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: o,
      validator: validator,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(17),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFF3B4349), fontSize: 18),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF9595E6)))),
    );
  }

// Definirção do Button
  _raisedButton(String label, cor, BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(18),
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      textColor: Colors.white,
      color: Color(cor),
      onPressed: () {
        controller.submitForm(context);
      },
    );
  }

  // Definição da valição do login
  String _validaLogin(String text) {
    if (text.isEmpty) return "Digite o login";
    return null;
  }

// Definição da valição do login
  String _validaSenha(String text) {
    if (text.isEmpty) return "Digite a senha";
    return null;
  }
}
