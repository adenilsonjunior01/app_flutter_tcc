import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/build_item_list_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/button_submit_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/form_input_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AlergiaPage extends StatefulWidget {
  final String title;
  const AlergiaPage({Key key, this.title = "Registro Alergia"})
      : super(key: key);

  @override
  _AlergiaPageState createState() => _AlergiaPageState();
}

class _AlergiaPageState extends ModularState<AlergiaPage, AlergiaController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    double _altura = MediaQuery.of(context).size.height;
    double _largura = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: _altura,
          width: _largura,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/form/bg_cadastro.png'),
                  fit: BoxFit.fill)),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                _body(context),
                FormInputAlergiaWidget(
                  controller: controller,
                  descHint: 'Descrição da alergia',
                ),
                TitleListaWidget('Lista'),
                Expanded(
                  child: BuildItemListAlergiaWidget(controller: controller),
                ),
                ButtonSubmitAlergiaWidget(
                  controller: controller,
                )
              ],
            ),
          ),
        ));
  }

  _body(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              OutlineButton(
                onPressed: () {
                  controller.backPage(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                borderSide: BorderSide(color: Color(0xFFEBEAEC)),
                shape: CircleBorder(),
              )
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Cadastro de Alergias",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3F414E),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
