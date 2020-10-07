import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/build_item_list_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/medicamento/button_submit_medicamento_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/medicamento/form_input_medicamento_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MedicamentoPage extends StatefulWidget {
  final String title;
  const MedicamentoPage({Key key, this.title = "Registro Medicamento"})
      : super(key: key);

  @override
  _MedicamentoPageState createState() => _MedicamentoPageState();
}

class _MedicamentoPageState
    extends ModularState<MedicamentoPage, MedicamentoController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Observer(builder: (_) {
          if (controller.status == RegistroStatusRequest.loading) {
            return Container(
              alignment: Alignment.center,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (controller.status == RegistroStatusRequest.none) {
            return Container(
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

                    // Input e botão de adiconar novo medicamento
                    FormInputMedicamentoWidget(
                      controller: controller,
                      descHint: 'Descrição do medicamento',
                    ),
                    // Título da Lista
                    TitleListaWidget('Lista'),

                    // Lista de Medicamento cadastrados
                    Expanded(
                      child: BuildItemListWidget(controller: controller),
                    ),

                    // ButtonSubmitMedicamentoWidget(
                    //   controller: controller,
                    // ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
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

                    // Input e botão de adiconar novo medicamento
                    FormInputMedicamentoWidget(
                      controller: controller,
                      descHint: 'Descrição do medicamento',
                    ),
                    // Título da Lista
                    TitleListaWidget('Lista'),

                    // Lista de Medicamento cadastrados
                    Expanded(
                      child: BuildItemListWidget(controller: controller),
                    ),

                    // ButtonSubmitMedicamentoWidget(
                    //   controller: controller,
                    // ),
                  ],
                ),
              ),
            );
          }
        }));
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
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  "Cadastro de Medicamentos",
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
