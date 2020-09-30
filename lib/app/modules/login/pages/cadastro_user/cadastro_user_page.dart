import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cadastro_user_controller.dart';

class CadastroUserPage extends StatefulWidget {
  final String title;
  const CadastroUserPage({Key key, this.title = "Criar conta"})
      : super(key: key);

  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState
    extends ModularState<CadastroUserPage, CadastroUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login/bg_cadastro_user.png'),
              fit: BoxFit.fill),
        ),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              _body(context),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                child: TextFormField(
                    style: TextStyle(color: Colors.white70),
                    controller: controller.nomeCompleto,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(13),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Nome completo",
                        hintStyle: TextStyle(color: Colors.white))),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextFormField(
                    style: TextStyle(color: Colors.white70),
                    controller: controller.email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(13),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "E-mail",
                        hintStyle: TextStyle(color: Colors.white))),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextFormField(
                    style: TextStyle(color: Colors.white70),
                    controller: controller.dtNascimento,
                    keyboardType: TextInputType.number,
                    inputFormatters: [controller.maskFormatterDate],
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(13),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Data de nascimento",
                        hintStyle: TextStyle(color: Colors.white))),
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextFormField(
                    style: TextStyle(color: Colors.white70),
                    controller: controller.telefone,
                    keyboardType: TextInputType.number,
                    inputFormatters: [controller.maskFormatterTel],
                    decoration: InputDecoration(
                        // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        contentPadding: EdgeInsets.all(13),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white10)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        hintText: "Telefone",
                        hintStyle: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: DropdownButtonFormField(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  value: controller.sexo,
                  onChanged: (newValue) {
                    setState(() {
                      controller.sexo = newValue;
                    });
                  },
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      hintStyle: TextStyle(color: Colors.white70)),
                  items: ['Masculino', 'Feminino']
                      .map<DropdownMenuItem>((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(color: Colors.black),
                          )))
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 30, right: 30),
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () => {},
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter Medium',
                        fontSize: 18),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 0),
                child: Text(
                  "Possui conta?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
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
      ),
    );
  }

  _body(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
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
          ),
          Column(
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 140),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
