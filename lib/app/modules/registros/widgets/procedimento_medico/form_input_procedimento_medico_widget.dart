import 'dart:convert';

import 'package:app_tcc/app/modules/registros/pages/procedimento_medico/procedimento_medico_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:intl/intl.dart';

class FormInputProcedimentoMedicoWidget extends StatefulWidget {
  ProcedimentoMedicoController controller;

  FormInputProcedimentoMedicoWidget({Key key, this.controller})
      : super(key: key);

  @override
  _FormInputProcedimentoMedicoWidgetState createState() =>
      _FormInputProcedimentoMedicoWidgetState();
}

class _FormInputProcedimentoMedicoWidgetState
    extends State<FormInputProcedimentoMedicoWidget> {
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.controller.formBuildKey,
      child: Column(
        children: [
          FormBuilderTextField(
              attribute: 'Título',
              controller: widget.controller.titulo,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFA49FBB),
                      )),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Título',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 10,
          ),
          FormBuilderDropdown(
              attribute: 'Tipo de procedimento',
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              onChanged: (newValue) {
                setState(() {
                  widget.controller.idTipoProcedimento = newValue;
                  print(jsonEncode(widget.controller.idTipoProcedimento));
                });
              },
              items: widget.controller.listTipoProcedimentos
                  .toList()
                  .map((tipo) => DropdownMenuItem(
                      value: tipo, child: Text("${tipo.descTipoProcedimeto}")))
                  .toList(),
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Tipo da procedimento',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
              attribute: 'Local (opcional)',
              controller: widget.controller.descLocal,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFA49FBB),
                      )),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Local (opcional)',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 10,
          ),
          FormBuilderDateTimePicker(
              attribute: 'Data de procedimento',
              inputType: InputType.date,
              format: DateFormat("dd-MM-yyyy"),
              style: TextStyle(color: Color(0xFF3B4349)),
              controller: widget.controller.dtProcedimento,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFA49FBB),
                      )),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Data de procedimento',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 10,
          ),
          FormBuilderDateTimePicker(
              attribute: 'Data do Retorno (opcional)',
              inputType: InputType.date,
              format: DateFormat("dd-MM-yyyy"),
              style: TextStyle(color: Color(0xFF3B4349)),
              controller: widget.controller.dtRetorno,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFA49FBB),
                      )),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Data do Retorno (opcional)',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 10,
          ),
          FormBuilderTextField(
              attribute: 'Descrição',
              controller: widget.controller.descricao,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFA49FBB))),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Color(0xFFA49FBB),
                      )),
                  // hintText: "Descrição do medicamento",
                  hintText: 'Descrição',
                  hintStyle:
                      TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          SizedBox(
            height: 20,
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
                  widget.controller.submitForm(context);
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
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
