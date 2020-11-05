import 'package:flutter_modular/flutter_modular.dart';

abstract class IHomeRepository implements Disposable {
  Future get getQuantitativo;
  Future get getDadosProcedimentosGeral;
  Future get getProcedimentosUltimosMeses;
}
