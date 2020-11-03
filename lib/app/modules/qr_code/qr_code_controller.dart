import 'dart:convert';

import 'package:app_tcc/app/modules/qr_code/qr_code_status_request.dart';
import 'package:app_tcc/app/modules/qr_code/repositories/qr_code_repository.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrcode/qrcode.dart';

part 'qr_code_controller.g.dart';

@Injectable()
class QrCodeController = _QrCodeControllerBase with _$QrCodeController;

abstract class _QrCodeControllerBase with Store {
  final QrCodeRepository repository;
  _QrCodeControllerBase(this.repository);

  QRCaptureController captureController = QRCaptureController();
  Animation<Alignment> animation;
  AnimationController animationController;

  @observable
  bool isTorchOn = false;
  @observable
  String captureText = '';

  @observable
  bool readQrCode = true;

  @observable
  String tokenQrCode;

  @observable
  QrCodeStatusRequest status = QrCodeStatusRequest.none;

  var mock =
      jsonEncode({'name': 'adenislon', 'idade': 27, 'sexo': 'masculino'});

  @action
  Future gerarMeuQrCode(BuildContext context) async {
    status = QrCodeStatusRequest.loading;
    try {
      final response = await repository.getMeuQrCode;
      tokenQrCode = response.token;
      status = QrCodeStatusRequest.success;
      showFlushBar(
          message: 'Token gerador com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = QrCodeStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao gerar token!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  showFlushBar(
      {String message, String type, String title, BuildContext context}) {
    switch (type) {
      case 'success':
        {
          FlushbarHelper.createSuccess(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'error':
        {
          FlushbarHelper.createError(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'warning':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'info':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      default:
        {
          Flushbar(
            title: title,
            message: message,
            duration: Duration(seconds: 4),
          )..show(context);
          break;
        }
    }
  }
}
