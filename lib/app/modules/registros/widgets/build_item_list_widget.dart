import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BuildItemListWidget extends StatelessWidget {
  BuildItemListWidget(this.controller);
  MedicamentoController controller = MedicamentoController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: controller.listItems.length,
          itemBuilder: (context, index) {
            var item = controller.listItems[index];
            return ItemWidget(item: item);
          });
    });
  }
}
