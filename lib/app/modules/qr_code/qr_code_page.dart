import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrcode/qrcode.dart';
import 'qr_code_controller.dart';

class QrCodePage extends StatefulWidget {
  final String title;
  const QrCodePage({Key key, this.title = "QrCode"}) : super(key: key);

  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends ModularState<QrCodePage, QrCodeController> {
  //use 'controller' variable to access controller~
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.captureController.onCapture((data) {
      print('onCapture----$data');
      controller.captureText = data;
      controller.readQrCode = false;
      if (data != '') {
        controller.captureController.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/form/bg_cadastro.png'),
              fit: BoxFit.fill)),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3B4349),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: Center(
                      child: Image.asset(
                        'assets/images/step/step2_img.png',
                        height: 250,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ButtonTheme(
                      child: FlatButton(
                        padding: EdgeInsets.all(13),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide(color: Color(0xFFA49FBB))),
                        onPressed: () {
                          _dialogCreateQrCode(context);
                        },
                        child: Text(
                          'Gerar meu QR Code',
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Inter Medium',
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ButtonTheme(
                      child: FlatButton(
                        padding: EdgeInsets.only(
                            left: 37, right: 37, top: 11, bottom: 11),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                            side: BorderSide(color: Color(0xFFA49FBB))),
                        onPressed: () {
                          controller.captureText = '';
                          controller.readQrCode = true;
                          _dialogReadQrCode(context);
                        },
                        child: Text(
                          'Ler QR Code',
                          style: TextStyle(
                              color: Colors.black54,
                              fontFamily: 'Inter Medium',
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  _dialogCreateQrCode(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Meu QR Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              child: SingleChildScrollView(child: Observer(builder: (_) {
                return Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 8),
                          width: 250,
                          height: 250,
                          child: QrImage(
                            data: "1234567890",
                            version: QrVersions.auto,
                            size: 200.0,
                          ),
                        );
                      },
                    ),
                  ],
                );
              })),
            ),
            actions: <Widget>[
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

  _dialogReadQrCode(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Escanear QR Code",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              child: SingleChildScrollView(child: Observer(builder: (_) {
                return Column(
                  children: [
                    Observer(
                      builder: (context) {
                        if (controller.readQrCode) {
                          return Container(
                            padding: EdgeInsets.only(bottom: 8),
                            width: 250,
                            height: 250,
                            child: QRCaptureView(
                              controller: controller.captureController,
                            ),
                          );
                        } else {
                          return Lottie.asset(
                            'assets/lotties-animation/check-success.json',
                            height: 50,
                          );
                          //     controller: controller.animationController,
                          //     onLoaded: (composition) {
                          //   controller.animationController
                          //     ..duration = composition.duration
                          //     ..forward();
                          // }
                        }
                      },
                    ),
                    ButtonTheme(
                      child: FlatButton(
                          padding: EdgeInsets.all(13),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                              side: BorderSide(color: Color(0xFFA49FBB))),
                          onPressed: () {
                            controller.captureController.resume();
                            controller.readQrCode = !controller.readQrCode;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.refresh),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Ler novamente',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontFamily: 'Inter Medium',
                                    fontSize: 14),
                              ),
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Observer(
                      builder: (context) {
                        if (controller.readQrCode == false) {
                          return ButtonTheme(
                            child: FlatButton(
                                padding: EdgeInsets.all(13),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7),
                                    side: BorderSide(color: Color(0xFFA49FBB))),
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.list),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Visualizar dados',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontFamily: 'Inter Medium',
                                          fontSize: 14),
                                    ),
                                  ],
                                )),
                          );
                        } else {
                          return Text('');
                        }
                      },
                    )
                  ],
                );
              })),
            ),
            actions: <Widget>[
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
}
