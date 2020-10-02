import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormInputAlergiaWidget extends StatefulWidget {
  AlergiaController controller;
  final String descHint;

  FormInputAlergiaWidget({this.controller, this.descHint});

  @override
  _FormInputAlergiaWidgetState createState() => _FormInputAlergiaWidgetState();
}

class _FormInputAlergiaWidgetState extends State<FormInputAlergiaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
                autocorrect: true,
                controller: widget.controller.desc,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                    contentPadding: EdgeInsets.all(13),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFA49FBB))),
                    // hintText: "Descrição do medicamento",
                    hintText: widget.descHint,
                    hintStyle:
                        TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
          ),
          // DropdownButtonFormField(
          //   value: widget.controller.tipo,
          //   onChanged: (newValue) {
          //     setState(() {
          //       // widget.controller.tipoAlergia = newValue;
          //     });
          //   },
          //   decoration: InputDecoration(
          //     // border: OutlineInputBorder(),
          //     contentPadding: EdgeInsets.all(16),
          //     labelStyle: TextStyle(color: Color(0xFF9595E6), fontSize: 18),
          //   ),
          //   items: ['Tipo 1', 'Tipo 2']
          //       .map<DropdownMenuItem>((String item) => DropdownMenuItem(
          //           value: item,
          //           child: Text(
          //             item,
          //             style: TextStyle(color: Color(0xFF3B4349)),
          //           )))
          //       .toList(),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: ButtonTheme(
              child: FlatButton(
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Color(0xFFA49FBB))),
                onPressed: () {
                  widget.controller.addItem();
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
