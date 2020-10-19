import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:qrcode/qrcode.dart';

part 'qr_code_controller.g.dart';

@Injectable()
class QrCodeController = _QrCodeControllerBase with _$QrCodeController;

abstract class _QrCodeControllerBase with Store {
  QRCaptureController captureController = QRCaptureController();
  Animation<Alignment> animation;
  AnimationController animationController;

  @observable
  bool isTorchOn = false;
  @observable
  String captureText = '';

  @observable
  bool readQrCode = true;
}
