import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/modules/registros/pages/alergia/alergia_controller.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/build_item_list_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/button_submit_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/alergia/form_input_alergia_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/text_delete_item_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/shared/widgets/not_found_404.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  void initState() {
    super.initState();
    controller.getAlergias(context);
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/form/bg_cadastro.png'),
                    fit: BoxFit.cover)),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Observer(
                builder: (context) {
                  if (controller.status == RegistroStatusRequest.loading) {
                    return LoadingLottie();
                  } else if (controller.status ==
                      RegistroStatusRequest.success) {
                    return Padding(
                        padding:
                            const EdgeInsets.only(top: 2, left: 20, right: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _body(context),
                              SizedBox(
                                height: 10,
                              ),
                              // Input e botão de adiconar novo medicamento
                              FormInputAlergiaWidget(
                                controller: controller,
                                descHint: 'Descrição do medicamento',
                              ),
                              // Título da Lista
                              TexteDeleteItemWidget(),
                              TitleListaWidget('Lista'),
                              Observer(
                                builder: (_) {
                                  if (controller.listAlergias.length < 1) {
                                    return NotFound404(
                                      message: 'Nenhum registro encontrado.',
                                    );
                                  } else {
                                    return Observer(builder: (_) {
                                      return ListView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.only(top: 10),
                                          itemCount:
                                              controller.listAlergias.length,
                                          itemBuilder: (_, index) {
                                            var list =
                                                controller.listAlergias[index];
                                            return Container(
                                                child: Dismissible(
                                                    onDismissed: (direction) {
                                                      _confirmDialog(
                                                          context, list);
                                                    },
                                                    background: Container(
                                                      color: Colors.red,
                                                      child: Align(
                                                        alignment: Alignment(
                                                            -0.9, 00.0),
                                                        child: Icon(
                                                          Icons.delete,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    direction: DismissDirection
                                                        .startToEnd,
                                                    key: Key(DateTime.now()
                                                        .millisecondsSinceEpoch
                                                        .toString()),
                                                    child: ListTile(
                                                      title: Text(
                                                          list.descAlergia ==
                                                                  null
                                                              ? ''
                                                              : list
                                                                  .descAlergia),
                                                      // leading: ,
                                                      trailing: IconButton(
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: Colors.grey,
                                                        ),
                                                        onPressed: () {
                                                          _dialog(
                                                              list, context);
                                                        },
                                                      ),
                                                      subtitle: Text(list
                                                                  .tipoAlergia
                                                                  .descTipo ==
                                                              null
                                                          ? ''
                                                          : list.tipoAlergia
                                                              .descTipo),
                                                    )));
                                          });
                                    });
                                  }
                                },
                              )
                            ],
                          ),
                        ));
                  } else if (controller.status == RegistroStatusRequest.error) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: CustomErrorRequestWidget(
                            message:
                                'Desculpe, ocorreu um erro ao tentar carregar a Lista de Alergias.',
                          ),
                        ),
                        ButtonTheme(
                          child: FlatButton(
                            padding: EdgeInsets.all(10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(color: Color(0xFFA49FBB))),
                            onPressed: () {
                              controller.getAlergias(context);
                            },
                            child: Text(
                              'Tentar novamente',
                              style: TextStyle(
                                  color: Color(0xFF3B4349),
                                  fontFamily: 'Inter Medium',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            )));
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
              SizedBox(
                height: MediaQuery.of(context).size.width / 4,
              ),
              Text(
                "Cadastro de Alergias",
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xFF3F414E),
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }

  _dialog(Alergias item, BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Editar Alergia",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: controller.formBuilderKey2,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                          attribute: 'Descrição do medicamento',
                          controller: controller.newDescAlergias,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigatório')
                          ],
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Descrição da Alergia',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown(
                          attribute: 'Tipo de alergia',
                          validators: [FormBuilderValidators.required()],
                          onChanged: (newValue) {
                            setState(() {
                              controller.newTipoAlergia = newValue;
                            });
                          },
                          items: controller.listTiposAlergia
                              .toList()
                              .map((tipoAlergia) => DropdownMenuItem(
                                  value: tipoAlergia,
                                  child: Text("${tipoAlergia.descTipo}")))
                              .toList(),
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Tipo da alergia',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  item.descAlergia = controller.newDescAlergias.text;
                  if (controller.formBuilderKey2.currentState
                      .saveAndValidate()) {
                    controller.editItem(item, context);
                    Navigator.pop(context);
                  } else {
                    return null;
                  }
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }

  String _inputVazio(String text) {
    if (text.isEmpty) return "Campo obrigatório";
    return null;
  }

  _confirmDialog(BuildContext context, Alergias med) {
    Widget cancelButton = FlatButton(
      child: Text('Não'),
      onPressed: () {
        // controller.setOldValueMedicamento();
        controller.getAlergias(context);
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text('Sim, continuar'),
      onPressed: () {
        controller.removeItem(med, context);
        Navigator.pop(context);
      },
    );
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Excluir Medicamento",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF3F414E),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Essa ação não poderá ser revertida, tem certeza que deseja continuar?',
          style: TextStyle(color: Color(0xFF3B4349), fontSize: 16),
        ),
        actions: [cancelButton, continueButton],
      ),
    );
  }
}
