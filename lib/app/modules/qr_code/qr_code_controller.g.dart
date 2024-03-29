// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_code_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $QrCodeController = BindInject(
  (i) => QrCodeController(i<QrCodeRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QrCodeController on _QrCodeControllerBase, Store {
  final _$isTorchOnAtom = Atom(name: '_QrCodeControllerBase.isTorchOn');

  @override
  bool get isTorchOn {
    _$isTorchOnAtom.reportRead();
    return super.isTorchOn;
  }

  @override
  set isTorchOn(bool value) {
    _$isTorchOnAtom.reportWrite(value, super.isTorchOn, () {
      super.isTorchOn = value;
    });
  }

  final _$captureTextAtom = Atom(name: '_QrCodeControllerBase.captureText');

  @override
  String get captureText {
    _$captureTextAtom.reportRead();
    return super.captureText;
  }

  @override
  set captureText(String value) {
    _$captureTextAtom.reportWrite(value, super.captureText, () {
      super.captureText = value;
    });
  }

  final _$readQrCodeAtom = Atom(name: '_QrCodeControllerBase.readQrCode');

  @override
  bool get readQrCode {
    _$readQrCodeAtom.reportRead();
    return super.readQrCode;
  }

  @override
  set readQrCode(bool value) {
    _$readQrCodeAtom.reportWrite(value, super.readQrCode, () {
      super.readQrCode = value;
    });
  }

  final _$tokenQrCodeAtom = Atom(name: '_QrCodeControllerBase.tokenQrCode');

  @override
  String get tokenQrCode {
    _$tokenQrCodeAtom.reportRead();
    return super.tokenQrCode;
  }

  @override
  set tokenQrCode(String value) {
    _$tokenQrCodeAtom.reportWrite(value, super.tokenQrCode, () {
      super.tokenQrCode = value;
    });
  }

  final _$statusAtom = Atom(name: '_QrCodeControllerBase.status');

  @override
  QrCodeStatusRequest get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(QrCodeStatusRequest value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$gerarMeuQrCodeAsyncAction =
      AsyncAction('_QrCodeControllerBase.gerarMeuQrCode');

  @override
  Future<dynamic> gerarMeuQrCode(BuildContext context) {
    return _$gerarMeuQrCodeAsyncAction.run(() => super.gerarMeuQrCode(context));
  }

  @override
  String toString() {
    return '''
isTorchOn: ${isTorchOn},
captureText: ${captureText},
readQrCode: ${readQrCode},
tokenQrCode: ${tokenQrCode},
status: ${status}
    ''';
  }
}
