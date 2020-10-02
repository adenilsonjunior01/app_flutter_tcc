import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/doenca_cronica/build_item_list_cronica_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/doenca_cronica/button_submit_cronica_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/doenca_cronica/form_input_cronica_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DoencaCronicaPage extends StatefulWidget {
  final String title;
  const DoencaCronicaPage({Key key, this.title = "Registro Doença Crônica"})
      : super(key: key);

  @override
  _DoencaCronicaPageState createState() => _DoencaCronicaPageState();
}

class _DoencaCronicaPageState
    extends ModularState<DoencaCronicaPage, DoencaCronicaController> {
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
                FormInputCronicaWidget(
                  controller: controller,
                  descHint: 'Descrição do medicamento',
                ),
                TitleListaWidget('Lista'),
                Expanded(
                  child: BuildItemListCronicaWidget(controller: controller),
                ),
                ButtonSubmitCronicaWidget(
                  controller: controller,
                ),
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
                  "Cadastro de Doença Crônica",
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
