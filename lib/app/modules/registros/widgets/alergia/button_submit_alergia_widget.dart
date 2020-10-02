import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSubmitAlergiaWidget extends StatelessWidget {
  AlergiaController controller;

  ButtonSubmitAlergiaWidget({this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ButtonTheme(
        minWidth: 200,
        child: FlatButton(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Color(0xFFA49FBB))),
          onPressed: () {},
          child: Text(
            'Salvar',
            style: TextStyle(
                color: Color(0xFF3B4349),
                fontFamily: 'Inter Medium',
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
