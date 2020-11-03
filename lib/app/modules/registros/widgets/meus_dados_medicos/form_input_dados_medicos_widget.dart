import 'package:app_tcc/app/modules/registros/pages/meus_dados_medicos/meus_dados_medicos_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormInputDadosMedicosWidget extends StatefulWidget {
  MeusDadosMedicosController controller;
  BuildContext context2;
  final String descHint;
  FormInputDadosMedicosWidget({this.controller, this.descHint, this.context2});

  @override
  _FormInputDadosMedicosWidgetState createState() =>
      _FormInputDadosMedicosWidgetState();
}

class _FormInputDadosMedicosWidgetState
    extends State<FormInputDadosMedicosWidget> {
  @override
  Widget build(BuildContext context) {
    var maskFormatterAltura = new MaskTextInputFormatter(
        mask: '#.##', filter: {"#": RegExp(r'[0-9]')});
    var maskFormatterPeso = new MaskTextInputFormatter(
        mask: '###.##', filter: {"#": RegExp(r'[0-9]')});
    return FormBuilder(
      key: widget.controller.formBuildKey,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: Observer(
            builder: (context) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderTextField(
                            attribute: 'Altura',
                            controller: widget.controller.altura,
                            inputFormatters: [maskFormatterAltura],
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(13),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                // hintText: "Descrição do medicamento",
                                hintText: 'Altura',
                                hintStyle: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: FormBuilderTextField(
                            attribute: 'Peso',
                            inputFormatters: [maskFormatterPeso],
                            controller: widget.controller.peso,
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(13),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                // hintText: "Descrição do medicamento",
                                hintText: 'Peso',
                                hintStyle: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: FormBuilderDropdown(
                            attribute: 'Tipo Sanguíneo',
                            onChanged: (newValue) {
                              setState(() {
                                print(
                                    '>>>>> ${newValue.descricaoTipoSanguineo}');
                                widget.controller.tipoSanguineo = newValue;
                              });
                            },
                            items: widget.controller.listSanguineo
                                .toList()
                                .map((tipo) => DropdownMenuItem(
                                    value: tipo,
                                    child:
                                        Text("${tipo.descricaoTipoSanguineo}")))
                                .toList(),
                            decoration: InputDecoration(
                                // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                contentPadding: EdgeInsets.all(13),
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xFFA49FBB))),
                                // hintText: "Descrição do medicamento",
                                hintText: 'Tipo da alergia',
                                hintStyle: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14))),
                      )
                    ],
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 10),
                    child: ButtonTheme(
                      child: FlatButton(
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: BorderSide(color: Color(0xFFA49FBB))),
                        onPressed: () {
                          // controller.addItem();
                          widget.controller.editDadosMedicos(widget.context2);
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
                ],
              );
            },
          )),
    );
  }
}
