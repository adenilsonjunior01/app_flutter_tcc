import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DoencaCronicaPage extends StatefulWidget {
  final String title;
  const DoencaCronicaPage({Key key, this.title = "Registro Doença Crônica"})
      : super(key: key);

  @override
  _DoencaCronicaPageState createState() => _DoencaCronicaPageState();
}

class _DoencaCronicaPageState
    extends ModularState<DoencaCronicaPage, DoencaCronicaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _body(context),
          Padding(
            child: TextFormField(
                autocorrect: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(17),
                    labelText: 'Qual doença crônica?',
                    labelStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 16),
                    // border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))))),
            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            textColor: Colors.white,
            padding: EdgeInsets.all(18),
            child: Text("Salvar", style: TextStyle(fontSize: 18)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            onPressed: () {},
            color: Color(0xFF2D59D8),
          )
        ],
      ),
    ));
  }

  _body(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/form/bg-header-form.png'),
                fit: BoxFit.fill)),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  OutlineButton(
                    onPressed: () {
                      controller.backPage(context);
                    },
                    child: Icon(Icons.arrow_back),
                    borderSide: BorderSide(color: Color(0xFFEBEAEC)),
                    shape: CircleBorder(),
                  )
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Cadastro de Doença Crônica",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF3F414E),
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
