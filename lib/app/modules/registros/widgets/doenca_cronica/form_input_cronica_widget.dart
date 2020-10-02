import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInputCronicaWidget extends StatelessWidget {
  DoencaCronicaController controller;
  final String descHint;

  FormInputCronicaWidget({this.controller, this.descHint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                autocorrect: true,
                controller: controller.descMedicamento,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(13),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    // hintText: "Descrição do medicamento",
                    hintText: descHint,
                    hintStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ButtonTheme(
              child: FlatButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Color(0xFFA49FBB))),
                onPressed: () {
                  controller.addItem();
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                      color: Color(0xFF3B4349),
                      fontFamily: 'Inter Medium',
                      fontSize: 18),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
