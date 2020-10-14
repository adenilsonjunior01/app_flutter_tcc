import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BuildItemListWidget extends StatelessWidget {
  BuildItemListWidget({this.controller});
  MedicamentoController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: controller.listMedicamento.length,
          itemBuilder: (_, index) {
            var list = controller.listMedicamento[index];
            return Observer(
              builder: (_) {
                return ListTile(
                  title: Text(list.descMedicamento),
                  // leading: ,
                  trailing: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                );
              },
            );
          });
    });
  }
}
