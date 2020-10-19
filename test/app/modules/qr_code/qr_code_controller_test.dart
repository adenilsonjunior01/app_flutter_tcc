import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_tcc/app/modules/qr_code/qr_code_controller.dart';
import 'package:app_tcc/app/modules/qr_code/qr_code_module.dart';

void main() {
  initModule(QrCodeModule());
  // QrCodeController qrcode;
  //
  setUp(() {
    //     qrcode = QrCodeModule.to.get<QrCodeController>();
  });

  group('QrCodeController Test', () {
    //   test("First Test", () {
    //     expect(qrcode, isInstanceOf<QrCodeController>());
    //   });

    //   test("Set Value", () {
    //     expect(qrcode.value, equals(0));
    //     qrcode.increment();
    //     expect(qrcode.value, equals(1));
    //   });
  });
}
