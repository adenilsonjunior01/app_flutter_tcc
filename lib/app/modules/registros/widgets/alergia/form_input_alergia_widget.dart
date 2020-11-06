import 'dart:convert';

import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormInputAlergiaWidget extends StatefulWidget {
  AlergiaController controller;
  BuildContext context2;
  final String descHint;
  FormInputAlergiaWidget({this.controller, this.descHint, this.context2});

  @override
  _FormInputAlergiaWidgetState createState() => _FormInputAlergiaWidgetState();
}

class _FormInputAlergiaWidgetState extends State<FormInputAlergiaWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
      child: FormBuilder(
        key: widget.controller.formBuilderKey,
        child: Column(
          children: [
            FormBuilderTextField(
                attribute: 'Descrição do Alergia',
                controller: widget.controller.descAlergias,
                validators: [
                  FormBuilderValidators.required(errorText: 'Campo obrigatório')
                ],
                decoration: InputDecoration(
                    // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(13),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    // hintText: "Descrição do medicamento",
                    hintText: 'Descrição da Alergia',
                    hintStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
            SizedBox(
              height: 10,
            ),
            FormBuilderDropdown(
                attribute: 'Tipo de alergia',
                validators: [
                  FormBuilderValidators.required(errorText: 'Campo obrigatório')
                ],
                onChanged: (newValue) {
                  setState(() {
                    widget.controller.tipoAlergia = newValue;
                    print(jsonEncode(widget.controller.tipoAlergia));
                  });
                },
                items: widget.controller.listTiposAlergia
                    .toList()
                    .map((tipoAlergia) => DropdownMenuItem(
                        value: tipoAlergia,
                        child: Text("${tipoAlergia.descTipo}")))
                    .toList(),
                decoration: InputDecoration(
                    // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(13),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    // hintText: "Descrição do medicamento",
                    hintText: 'Tipo da alergia',
                    hintStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ButtonTheme(
                child: FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Color(0xFFA49FBB))),
                  onPressed: () {
                    // controller.addItem();
                    widget.controller.submitForm(widget.context2);
                  },
                  child: Text(
                    'Salvar',
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
      ),
    );
  }
}
