import 'package:app_tcc/app/pages/steps-info/step_first/step_first_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';

class StepFirstPage extends StatefulWidget {
  final String title;
  const StepFirstPage({Key key, this.title = "Step First"}) : super(key: key);

  @override
  _StepFirstPageState createState() => _StepFirstPageState();
}

class _StepFirstPageState
    extends ModularState<StepFirstPage, StepFirstController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _body(context),
    );
  }

  _body(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          // height: _altura,
          // width: _largura,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/step/bg_step.png'),
                  fit: BoxFit.fill)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _next(context),
              _imgCenter(context),
              _description(context),
              _nextButon(context)
            ],
          ),
        ));
  }

  Widget _next(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          controller.skipStep(context);
        },
        textColor: Colors.black,
        child:
            Text("Pular", style: TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }

  Widget _imgCenter(BuildContext context) {
    return Container(
      child: Center(
        child: Image.asset(
          'assets/images/step/step1_img.png',
          height: 250,
        ),
      ),
    );
  }

  Widget _description(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Color(0xFF388AF7),
                    ),
                  ),
                  Center(
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                      color: Color(0xFFE5E8EE),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 250,
              child: Text(
                "Registre seus dados médicos e acompanhe sua rotina com facilidade.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter Medium',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _nextButon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        minWidth: 200,
        child: FlatButton(
          padding: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Color(0xFFA49FBB))),
          onPressed: () {
            controller.navegateSecondPage(context);
          },
          child: Text(
            'Próximo',
            style: TextStyle(
                color: Color(0xFF3B4349),
                fontFamily: 'Inter Medium',
                fontSize: 18),
          ),
        ),
      ),
    );
  }
}
