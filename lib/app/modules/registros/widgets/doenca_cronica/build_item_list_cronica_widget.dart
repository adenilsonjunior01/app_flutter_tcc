import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/doenca_cronica/item_cronica_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class BuildItemListCronicaWidget extends StatelessWidget {
  BuildItemListCronicaWidget({this.controller});
  DoencaCronicaController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: controller.listItems.length,
          itemBuilder: (context, index) {
            var item = controller.listItems[index];
            return ItemCronicaWidget(
              item: item,
              itemRemoved: item,
              controller: controller,
            );
          });
    });
  }
}
