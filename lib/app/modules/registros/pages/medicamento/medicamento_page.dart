import 'package:app_tcc/app/modules/registros/models/registros_model.dart';
import 'package:app_tcc/app/modules/registros/pages/medicamento/medicamento_controller.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/build_item_list_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/text_delete_item_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/custom/title_lista_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/medicamento/button_submit_medicamento_widget.dart';
import 'package:app_tcc/app/modules/registros/widgets/medicamento/form_input_medicamento_widget.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/shared/widgets/not_found_404.dart';
import 'package:app_tcc/app/shared/widgets/shimmer_layout_widget.dart';
import 'package:app_tcc/app/widgets/nav_bar_silver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shimmer/shimmer.dart';

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
    controller.getMedicamentos(context);
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
                children: [NavBarSilverWidget(), _contentForm(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  _contentForm(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2, left: 10, right: 10),
      child: Column(
        children: [
          _title(context),
          // Input e botão de adiconar novo medicamento
          FormInputMedicamentoWidget(
            controller: controller,
            descHint: 'Descrição do medicamento',
            context2: context,
          ),
          // Título da Lista
          TexteDeleteItemWidget(),
          Expanded(child: _contentList(context)),
        ],
      ),
    );
  }

  _title(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width * 0.5,
        ),
        Text(
          "Medicamentos",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF3F414E),
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20,
        )
      ],
    ));
  }

  _contentList(BuildContext context) {
    return Observer(builder: (_) {
      if (controller.status == RegistroStatusRequest.loading) {
        return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ListView(
              shrinkWrap: true,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300],
                      child: ShimmerLayout()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300],
                      child: ShimmerLayout()),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 80,
                  child: Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300],
                      child: ShimmerLayout()),
                ),
              ],
            ));
      } else if (controller.listMedicamento.length < 1) {
        return NotFound404(
          message: 'Nenhum registro encontrado.',
        );
      } else {
        return ListView.separated(
            separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.black,
                ),
            itemCount: controller.listMedicamento.length,
            itemBuilder: (_, index) {
              var list = controller.listMedicamento[index];
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
                      key:
                          Key(DateTime.now().millisecondsSinceEpoch.toString()),
                      child: ListTile(
                        title: Text(list.descMedicamento == null
                            ? ''
                            : list.descMedicamento),
                        subtitle: Builder(
                          builder: (context) {
                            if (list.profissionalSaude == null) {
                              return Text('');
                            } else {
                              return Text('Médico: ${list.profissionalSaude}');
                            }
                          },
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            _dialog(list);
                          },
                        ),
                        leading: Builder(
                          builder: (context) {
                            print(
                                'PROFISSIONAL SAUDE>> ${list.profissionalSaude}');
                            if (list.profissionalSaude == null) {
                              return Icon(
                                Icons.perm_identity,
                                color: Color(0xFF2E3A59),
                                size: 30,
                              );
                            } else {
                              return Image.asset(
                                'assets/images/logo.png',
                                height: 35,
                              );
                            }
                          },
                        ),
                      )));
            });
      }
    });
  }

  _dialog(Medicamentos item) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Editar Medicamento",
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
                  controller: controller.newDescMedicamento,
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
                      hintText: 'Descrição do medicamento',
                      hintStyle:
                          TextStyle(color: Color(0xFF3B4349), fontSize: 14))),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  item.descMedicamento = controller.newDescMedicamento.text;
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

  _confirmDialog(BuildContext context, Medicamentos med) {
    Widget cancelButton = FlatButton(
      child: Text('Não'),
      onPressed: () {
        // controller.setOldValueMedicamento();
        controller.getMedicamentos(context);
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
