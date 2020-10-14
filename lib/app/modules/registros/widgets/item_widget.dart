import 'package:app_tcc/app/modules/registros/models/item_medicamento_model.dart';
import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget({
    Key key,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  final RegistrosModel item;
  final MedicamentoController controller;
  final Function desfazerAcao;
  final RegistrosModel itemRemoved;

  _ItemWidgetState(
      {this.item, this.controller, this.desfazerAcao, this.itemRemoved});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getMedicamentos(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
          onDismissed: (direction) {
            // controller.removeItem(item);
            final snack = SnackBar(
              duration: Duration(seconds: 3),
              content: Text("Item removido"),
              action: SnackBarAction(
                label: "Desfazer",
                onPressed: () {
                  // controller.addLastItem(itemRemoved);
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
            return ListView.builder(itemBuilder: (context, index) {
              ListTile(
                leading: Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF3B4349),
                ),
                title: Text(''),
                // title: Text(item.medicamentos),
                isThreeLine: true,
                trailing: FlatButton(
                  onPressed: () {},
                  child: Icon(Icons.edit),
                ),
              );
            });
          })),
    );
  }
}
