import 'package:app_tcc/app/modules/login/animation/fade_animation.dart';
import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  initState() {
    super.initState();
    controller.verifyToken();
    controller.status = LoginStatus.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (controller.status == LoginStatus.loading) {
          return LoadingLottie();
        } else if (controller.status == LoginStatus.none) {
          return SingleChildScrollView(
            child: body(context),
          );
        } else {
          return SingleChildScrollView(
            child: body(context),
          );
        }
      }),
    );
  }

  body(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;

    @override
    Widget bg() => Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login/bg_login2.png'),
                fit: BoxFit.cover)));
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
                    child: Form(
                  key: controller.formKey,
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
                                  onPressed: () =>
                                      controller.submitForm(context),
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
                )),
              ),
            ),
          ],
        ),
      ),
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
