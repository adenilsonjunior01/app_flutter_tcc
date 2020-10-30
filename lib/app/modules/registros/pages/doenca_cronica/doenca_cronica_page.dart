import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/modules/registros/pages/doenca_cronica/doenca_cronica_controller.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/text_delete_item_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/doenca_cronica/form_input_cronica_widget.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/shared/widgets/not_found_404.dart';
import 'package:app_tcc/app/widgets/nav_bar_silver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getDoencasCronicas(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: _body(context));
  }

  _body(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/form/bg_cadastro.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  NavBarSilverWidget(),
                  Observer(
                    builder: (context) {
                      if (controller.status == RegistroStatusRequest.loading) {
                        return LoadingLottie();
                      } else if (controller.status ==
                          RegistroStatusRequest.success) {
                        return _contentForm(context);
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(left: 20, right: 20),
                          alignment: Alignment.center,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomErrorRequestWidget(
                                message:
                                    'Ocorreu um erro ao tentar carregar a Lista de doenças crônicas.',
                              ),
                              ButtonTheme(
                                child: FlatButton(
                                  padding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side:
                                          BorderSide(color: Color(0xFFA49FBB))),
                                  onPressed: () {
                                    controller.getDoencasCronicas(context);
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
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _title(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 3,
              ),
              Text(
                "Cadastro de Doenças Crônicas",
                textAlign: TextAlign.center,
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

  _contentForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 5, right: 5),
      child: Column(
        children: [
          _title(context),
          FormInputCronicaWidget(
              controller: controller,
              descHint: 'Descrição da doença crônica',
              context2: context),
          TexteDeleteItemWidget(),
          TitleListaWidget('Lista'),
          Expanded(child: Observer(
            builder: (_) {
              if (controller.listDoencaCronica.length < 1) {
                return NotFound404(
                  message: 'Nenhum registro encontrado.',
                );
              } else {
                return _contentList(context);
              }
            },
          ))
        ],
      ),
    );
  }

  _contentList(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          padding: EdgeInsets.only(top: 10),
          itemCount: controller.listDoencaCronica.length,
          itemBuilder: (_, index) {
            var list = controller.listDoencaCronica[index];
            return Container(
                child: Dismissible(
                    onDismissed: (direction) {
                      _confirmDialog(context, list);
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
                    child: ListTile(
                      title:
                          Text(list.descDoenca == null ? '' : list.descDoenca),
                      // leading: ,
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _dialog(list);
                        },
                      ),
                    )));
          });
    });
  }

  _dialog(DoencasCronicas item) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Editar Doença Crônica",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Form(
              key: controller.formKey,
              child: TextFormField(
                  autocorrect: true,
                  controller: controller.newdescDoencaCronica,
                  validator: _inputVazio,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      contentPadding: EdgeInsets.all(8),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA49FBB))),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFA49FBB))),
                      // hintText: "Descrição do medicamento",
                      hintText: 'Descrição do Doença Crônica',
                      hintStyle:
                          TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  item.descDoenca = controller.newdescDoencaCronica.text;
                  controller.editItem(item, context);
                  bool formValido = controller.formKey.currentState.validate();
                  if (!formValido) {
                    return;
                  } else {
                    Navigator.pop(context);
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

  _confirmDialog(BuildContext context, DoencasCronicas med) {
    Widget cancelButton = FlatButton(
      child: Text('Não'),
      onPressed: () {
        // controller.setOldValueMedicamento();
        controller.getDoencasCronicas(context);
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
          "Excluir Doença Crônica",
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
