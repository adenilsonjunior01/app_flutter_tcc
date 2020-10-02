import 'package:app_tcc/app/modules/login/animation/fade_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      body: SingleChildScrollView(
        child: body(context),
      ),
    );
  }

  body(BuildContext context) {
    double _altura = MediaQuery.of(context).size.height;
    double _largura = MediaQuery.of(context).size.width;
    @override
    Widget bg() => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login/bg_login2.png'),
                fit: BoxFit.cover)));
// SingleChildScrollView

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _altura,
              width: _largura,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login/bg_login2.png'),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _altura / 2 - 100,
                      ),
                      FadeAnimation(
                        1.8,
                        Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Login',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Inter Bold',
                                      fontSize: 34),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 15),
                                child: TextFormField(
                                    style: TextStyle(color: Colors.white70),
                                    controller: controller.user,
                                    keyboardType: TextInputType.text,
                                    validator: _validaLogin,
                                    decoration: InputDecoration(
                                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                        contentPadding: EdgeInsets.all(15),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        hintText: "Email",
                                        hintStyle:
                                            TextStyle(color: Colors.white))),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 18),
                                child: TextFormField(
                                    style: TextStyle(color: Colors.white70),
                                    controller: controller.password,
                                    keyboardType: TextInputType.text,
                                    validator: _validaSenha,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                        contentPadding: EdgeInsets.all(13),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white10)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                        hintText: "Senha",
                                        hintStyle:
                                            TextStyle(color: Colors.white))),
                              ),
                              Container(
                                alignment: Alignment.centerRight,
                                child: FlatButton(
                                  onPressed: () {
                                    controller.navegateResetarSenha(context);
                                  },
                                  child: Text(
                                    "Esqueceu a senha?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter Bold'),
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: FlatButton(
                                  padding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(color: Colors.white)),
                                  onPressed: () {},
                                  child: Text(
                                    'Entrar',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Inter Medium',
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, bottom: 0),
                                child: Text(
                                  "Precisa de uma conta?",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                              FlatButton(
                                onPressed: () => {
                                  controller.navegaRegisterUserPage(context)
                                },
                                child: Text(
                                  'Criar conta',
                                  style: TextStyle(
                                      shadows: [
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 2.0,
                                          color: Colors.black,
                                        ),
                                        Shadow(
                                          offset: Offset(1, 1),
                                          blurRadius: 2.0,
                                          color: Colors.black,
                                        )
                                      ],
                                      color: Colors.white,
                                      fontFamily: 'Inter Medium',
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _newBody(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/login/bg_login.png'),
                      fit: BoxFit.cover)),
              height: 180,
            ),
            Positioned(
              child: FadeAnimation(
                  1.6,
                  Container(
                    child: Center(
                      child: Text(
                        "Autenticação",
                        style: TextStyle(
                            color: Color(0xFF388AF7),
                            fontSize: 40,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(
                      1.8,
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom:
                                          BorderSide(color: Colors.grey[100]))),
                              child: TextFormField(
                                  controller: controller.user,
                                  keyboardType: TextInputType.text,
                                  validator: _validaLogin,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Email",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]))),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                  controller: controller.password,
                                  keyboardType: TextInputType.text,
                                  validator: _validaSenha,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Senha",
                                      hintStyle:
                                          TextStyle(color: Colors.grey[400]))),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  FadeAnimation(
                      2,
                      Container(
                        child: ButtonTheme(
                            minWidth: 1000,
                            child:
                                _raisedButton("Enviar", 0xFF007AFE, context)),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  FadeAnimation(
                      1.5,
                      Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Text(
                              "Precisa de uma conta NomeApp?",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey[700],
                                  fontFamily: 'Inter Medium',
                                  fontWeight: FontWeight.w500),
                            ),
                            FlatButton(
                              onPressed: () {
                                controller.navegaRegisterUserPage(context);
                              },
                              child: Text("Crie a sua conta aqui",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF388AF7),
                                      fontFamily: 'Inter Bold',
                                      fontWeight: FontWeight.w500)),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
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
                SvgPicture.asset(
                  'assets/images/logo.svg',
                  height: 100,
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
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextFormField(
                      controller: controller.user,
                      keyboardType: TextInputType.text,
                      validator: _validaLogin,
                      decoration: InputDecoration(
                          hintText: "Digite seu e-mail aqui",
                          contentPadding: EdgeInsets.all(17),
                          labelText: "E-mail",
                          icon: Icon(
                            Icons.email,
                            color: Color(0xFF37C6F7),
                          ),
                          labelStyle:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 18),
                          // border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFF37C6F7))))),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: TextFormField(
                      controller: controller.password,
                      keyboardType: TextInputType.text,
                      validator: _validaSenha,
                      obscureText: true,
                      decoration: InputDecoration(
                          hintText: "Digite sua senha aqui",
                          contentPadding: EdgeInsets.all(17),
                          labelText: "Senha",
                          icon: Icon(
                            Icons.lock,
                            color: Color(0xFF37C6F7),
                          ),
                          labelStyle:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 18),
                          // border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFF37C6F7))))),
                ),
                Padding(
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: ButtonTheme(
                        minWidth: 1000,
                        child: _raisedButton("Enviar", 0xFF007AFE, context))),
                Padding(
                  padding: EdgeInsets.only(top: 150),
                  child: Column(
                    children: [
                      Text(
                        "Precisa de uma conta NomeApp?",
                        style: TextStyle(fontSize: 16),
                      ),
                      FlatButton(
                        onPressed: () {
                          controller.navegaRegisterUserPage(context);
                        },
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
          // border: OutlineInputBorder(),
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
