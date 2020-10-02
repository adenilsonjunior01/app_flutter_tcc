import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'resetar_senha_controller.dart';

class ResetarSenhaPage extends StatefulWidget {
  final String title;
  const ResetarSenhaPage({Key key, this.title = "ResetarSenha"})
      : super(key: key);

  @override
  _ResetarSenhaPageState createState() => _ResetarSenhaPageState();
}

class _ResetarSenhaPageState
    extends ModularState<ResetarSenhaPage, ResetarSenhaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _altura = MediaQuery.of(context).size.height;
    double _largura = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: _altura,
          width: _largura,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login/bg_cadastro_user.png'),
                  fit: BoxFit.fill)),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: OutlineButton(
                          onPressed: () {
                            controller.backPage(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          borderSide: BorderSide(color: Colors.white),
                          shape: CircleBorder(),
                        ),
                      )
                    ],
                  ),
                  _form(context),
                  Container(
                    child: Text(
                      "Conseguiu resetar sua senha?",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  FlatButton(
                    onPressed: () => {},
                    child: Text(
                      'Entrar',
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
          )),
    );
  }

  Widget _titleForm(BuildContext context) {
    return Text(
      "Resetar Senha",
      style: (TextStyle(fontSize: 32, color: Colors.white)),
    );
  }

  Widget _buttonEnviar(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(left: 30, right: 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.white)),
      onPressed: () => {},
      child: Text(
        'Entrar',
        style: TextStyle(
            color: Colors.white, fontFamily: 'Inter Medium', fontSize: 18),
      ),
    );
  }

  Widget _form(BuildContext context) {
    double _altura = MediaQuery.of(context).size.height;
    double _largura = MediaQuery.of(context).size.width;
    return Container(
      height: _altura / 2 + 220,
      width: _largura,
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _titleForm(context),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              style: TextStyle(color: Colors.white70),
              controller: controller.email,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(15),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Email",
                  hintStyle: TextStyle(color: Colors.white))),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _buttonEnviar(context),
          ),
        ],
      ),
    );
  }
}
