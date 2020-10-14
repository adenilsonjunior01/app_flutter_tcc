import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemAlergiaWidget extends StatelessWidget {
  const ItemAlergiaWidget(
      {Key key,
      this.item,
      this.controller,
      this.itemRemoved,
      this.desfazerAcao})
      : super(key: key);

  final ItemModel item;
  final AlergiaController controller;
  final Function desfazerAcao;
  final ItemModel itemRemoved;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        onDismissed: (direction) {
          print(itemRemoved);
          // controller.removeItem(item);
          print(item.title);
          final snack = SnackBar(
            duration: Duration(seconds: 3),
            content: Text("Item removido"),
            action: SnackBarAction(
              label: "Desfazer",
              onPressed: () {
                controller.addLastItem(itemRemoved);
                print(controller.listItems);
              },
            ),
          );
          Scaffold.of(context).showSnackBar(snack);
        },
        background: Container(
          color: Colors.red,
          child: Align(
            alignment: Alignment(-0.9, 00.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.startToEnd,
        key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
        child: Observer(builder: (_) {
          return CheckboxListTile(
            title: Text(item.title),
            value: item.check,
            secondary: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.check_circle_outline,
                color: Color(0xFF3B4349),
              ),
            ),
            onChanged: item.setChcek,
          );
        }));
  }
}
