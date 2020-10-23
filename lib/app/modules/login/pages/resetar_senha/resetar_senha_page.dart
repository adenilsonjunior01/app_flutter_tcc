import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    final rota = ModalRoute.of(context).settings.arguments;
    print(rota);
    return Scaffold(
      body: Container(
        height: _altura,
        width: _largura,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/login/bg_cadastro_user.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  flexibleSpace: FlexibleSpaceBar(
                    title: const Text(
                      '',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF3B4349),
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                    centerTitle: true,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _altura / 2 - 150,
                  ),
                  _form(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _form(BuildContext context) {
    return Flexible(
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: _titleForm(context),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: SingleChildScrollView(
              child: FormBuilder(
                key: controller.formBuilderKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                        attribute: 'Email',
                        controller: controller.email,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(13),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // hintText: "Descrição do medicamento",
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 14))),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Text(
                        'Ou',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FormBuilderTextField(
                        attribute: 'Código de validação',
                        controller: controller.codigoVerificacao,
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(13),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            // hintText: "Descrição do medicamento",
                            hintText: 'Código de validação',
                            hintStyle:
                                TextStyle(color: Colors.white, fontSize: 14))),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: _buttonEnviar(context),
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // _footer(context)
        ],
      ),
    );
  }

  Widget _titleForm(BuildContext context) {
    return Text(
      "Digite seu e-mail de cadastro",
      style: (TextStyle(fontSize: 28, color: Colors.white)),
    );
  }

  Widget _buttonEnviar(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(left: 30, right: 30),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: Colors.white)),
      onPressed: () => controller.verifyAction(context),
      child: Text(
        'Enviar',
        style: TextStyle(
            color: Colors.white, fontFamily: 'Inter Medium', fontSize: 18),
      ),
    );
  }

  Widget _footer(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "Conseguiu resetar sua senha?",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        FlatButton(
          onPressed: () => {Modular.link.pushNamed('/')},
          child: Text(
            'Entrar',
            style: TextStyle(shadows: [
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
            ], color: Colors.white, fontFamily: 'Inter Medium', fontSize: 18),
          ),
        )
      ],
    );
  }
}
