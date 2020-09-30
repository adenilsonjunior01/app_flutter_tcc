import 'dart:convert';
import 'dart:io';

import 'package:app_tcc/app/modules/registros/models/item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:path_provider/path_provider.dart';

part 'medicamento_controller.g.dart';

@Injectable()
class MedicamentoController = _MedicamentoControllerBase
    with _$MedicamentoController;

abstract class _MedicamentoControllerBase with Store {
  @observable
  int value = 0;

  final descMedicamento = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @observable
  var objetos = ObservableList<dynamic>();

  @action
  void addSkil() {
    Map<String, dynamic> newSkil = Map();
    newSkil["title"] = descMedicamento.text;
    descMedicamento.text = "";

    newSkil["ok"] = false;
    objetos.add(newSkil);
  }

// -----------------------------------------------
  @observable
  var listItems = ObservableList<ItemModel>();

  @action
  addItem() {
    final item = ItemModel(title: descMedicamento.text);
    listItems.add(item);
    descMedicamento.text = "";
  }

  // @action
  // removeItem(ItemModel model) {
  //   var list = listItems.asObservable().add(element)
  // }

  @action
  void increment() {
    value++;
  }

  @action
  backPage(BuildContext context) {
    Navigator.pop(context);
  }

  buildTextField(String label, TextEditingController controller,
      TextInputType type, String hint, bool o,
      {FormFieldValidator<String> validator, MaskTextInputFormatter mask}) {
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: o,
      inputFormatters: [mask],
      validator: validator,
      decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(17),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFF3B4349), fontSize: 16),
          // border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFA49FBB)))),
    );
  }

// armazena no dispositvo os valores da lista
  Future<File> getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> saveData() async {
    String data = json.encode(descMedicamento.text);
    final file = await getFile();
    return file.writeAsString(data);
  }

  Future<String> readData() async {
    try {
      final file = await getFile();

      return file.readAsString();
    } catch (e) {
      return null;
    }
  }
}
