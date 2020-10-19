import 'package:flutter_modular/flutter_modular.dart';

abstract class IQrCodeRepository implements Disposable {
  Future fetchPost();
}
