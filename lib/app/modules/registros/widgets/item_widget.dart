import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key key, this.item}) : super(key: key);
  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
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
              child: Icon(item.check ? Icons.check : Icons.error),
            ),
            onChanged: item.setChcek,
          );
        }));
  }
}
