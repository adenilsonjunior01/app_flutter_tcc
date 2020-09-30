import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlergiaPage extends StatefulWidget {
  final String title;
  const AlergiaPage({Key key, this.title = "Registro Alergia"})
      : super(key: key);

  @override
  _AlergiaPageState createState() => _AlergiaPageState();
}

class _AlergiaPageState extends ModularState<AlergiaPage, AlergiaController> {
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
                    labelText: 'Digite o nome da alergia aqui',
                    labelStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 16),
                    // border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))))),
            padding: EdgeInsets.fromLTRB(0, 25, 0, 10),
          ),
          DropdownButtonFormField(
            value: controller.tipoAlergia,
            onChanged: (newValue) {
              setState(() {
                controller.tipoAlergia = newValue;
              });
            },
            decoration: InputDecoration(
              // border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(16),
              labelStyle: TextStyle(color: Color(0xFF9595E6), fontSize: 18),
            ),
            items: ['Tipo 1', 'Tipo 2']
                .map<DropdownMenuItem>((String item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(color: Color(0xFF3B4349)),
                    )))
                .toList(),
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
                      "Cadastro de Alergias",
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
