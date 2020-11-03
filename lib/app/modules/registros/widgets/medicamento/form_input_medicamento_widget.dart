import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormInputMedicamentoWidget extends StatelessWidget {
  MedicamentoController controller;
  BuildContext context2;
  final String descHint;

  FormInputMedicamentoWidget({this.controller, this.descHint, this.context2});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formBuilderKey,
      child: Row(
        children: [
          Expanded(
            child: FormBuilderTextField(
                attribute: 'Descrição do medicamento',
                controller: controller.descMedicamento,
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
                    hintText: 'Descrição do medicamento',
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
                  // controller.addItem();
                  controller.submitForm(context2);
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
