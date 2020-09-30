import 'dart:convert';

import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/build_item_list_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicamentoPage extends StatefulWidget {
  final String title;
  const MedicamentoPage({Key key, this.title = "Registro Medicamento"})
      : super(key: key);

  @override
  _MedicamentoPageState createState() => _MedicamentoPageState();
}

class _MedicamentoPageState
    extends ModularState<MedicamentoPage, MedicamentoController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: controller.formKey,
      child: Column(
        children: [
          _body(context),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                      autocorrect: true,
                      controller: controller.descMedicamento,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(17),
                          labelText: 'Digite o medicamento aqui',
                          labelStyle:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 16),
                          // border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Color(0xFFA49FBB))))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: RaisedButton(
                    onPressed: () {
                      controller.addItem();
                    },
                    color: Color(0xFF2D59D8),
                    child: Text("ADD"),
                    textColor: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: BuildItemListWidget(controller),
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
                      "Cadastro de Medicamentos",
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
