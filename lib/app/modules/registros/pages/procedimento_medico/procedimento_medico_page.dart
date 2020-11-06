import 'package:app_tcc/app/modules/registros/models/get_procedimento_medico.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/procedimento_medico/form_input_procedimento_medico_widget.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/widgets/nav_bar_silver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'procedimento_medico_controller.dart';

class ProcedimentoMedicoPage extends StatefulWidget {
  final String title;
  const ProcedimentoMedicoPage({Key key, this.title = "ProcedimentoMedico"})
      : super(key: key);

  @override
  _ProcedimentoMedicoPageState createState() => _ProcedimentoMedicoPageState();
}

class _ProcedimentoMedicoPageState
    extends ModularState<ProcedimentoMedicoPage, ProcedimentoMedicoController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getTipoProcedimentos(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
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
                              RegistroStatusRequest.success ||
                          controller.status == RegistroStatusRequest.none) {
                        return _contentForm(context);
                      }
                      // else {
                      //   return Column(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Padding(
                      //         padding:
                      //             const EdgeInsets.only(left: 15, right: 15),
                      //         child: CustomErrorRequestWidget(
                      //           message:
                      //               'Desculpe, ocorreu um erro, tente novamente mais tarde.',
                      //         ),
                      //       ),
                      //       ButtonTheme(
                      //         child: FlatButton(
                      //           padding: EdgeInsets.all(10),
                      //           shape: RoundedRectangleBorder(
                      //               borderRadius: BorderRadius.circular(5),
                      //               side: BorderSide(color: Color(0xFFA49FBB))),
                      //           onPressed: () {
                      //             // Navigator.pop(context);
                      //             controller.resetStatus();
                      //           },
                      //           child: Text(
                      //             'Tentar novamente',
                      //             style: TextStyle(
                      //                 color: Color(0xFF3B4349),
                      //                 fontFamily: 'Inter Medium',
                      //                 fontSize: 16),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   );
                      // }
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _contentForm(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(top: 2, left: 20, right: 20),
      child: ListView(
        children: [
          _title(context),
          SizedBox(
            height: 10,
          ),
          FormInputProcedimentoMedicoWidget(
              controller: controller, context: context),
        ],
      ),
    );
  }

  _title(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Observer(builder: (_) {
            return Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.5,
                ),
                Text(
                  controller.paramsRoute != null
                      ? "Editar Procedimento Médico"
                      : 'Cadastro Procedimento Médico',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF3F414E),
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              ],
            );
          })
        ],
      ),
    );
  }
}
