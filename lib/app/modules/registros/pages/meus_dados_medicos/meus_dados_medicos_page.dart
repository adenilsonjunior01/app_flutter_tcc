import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/modules/registros/widgets/meus_dados_medicos/form_input_dados_medicos_widget.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/widgets/nav_bar_silver_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'meus_dados_medicos_controller.dart';

class MeusDadosMedicosPage extends StatefulWidget {
  final String title;
  const MeusDadosMedicosPage({Key key, this.title = "MeusDadosMedicos"})
      : super(key: key);

  @override
  _MeusDadosMedicosPageState createState() => _MeusDadosMedicosPageState();
}

class _MeusDadosMedicosPageState
    extends ModularState<MeusDadosMedicosPage, MeusDadosMedicosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.getTiposAlergia(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                                // controller.getAlergias(context);
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
                )
              ],
            ),
          )
        ],
      ),
    ));
  }

  _contentForm(BuildContext context) {
    return Column(
      children: [
        _title(context),
        SizedBox(
          height: 20,
        ),
        FormInputDadosMedicosWidget(
          controller: controller,
          descHint: 'Dados médicos',
          context2: context,
        ),
      ],
    );
  }

  _title(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.width / 3,
        ),
        Text(
          "Dados Médicos",
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color(0xFF3F414E),
              fontSize: 28,
              fontWeight: FontWeight.bold),
        ),
      ],
    ));
  }
}
