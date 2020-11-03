import 'package:flutter_modular/flutter_modular.dart';

abstract class IQrCodeRepository implements Disposable {
  Future get getMeuQrCode;
  Future getProcedimentosMedicosQrCode(dynamic data);
  Future getDadosMedicosQrCode(dynamic data);

  Future cadastroMedicamento(dynamic data);
  Future cadastroAlergia(dynamic data);
  Future cadastroDoencaCronica(dynamic data);
  Future cadastroProcedimentoMedico(dynamic data);
}
