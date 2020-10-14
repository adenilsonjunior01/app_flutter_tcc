import 'package:app_tcc/app/modules/registros/models/registros_model.dart';

abstract class IAlergiaRepostory {
  Future get getAlergia;
  Future<Alergias> registerNewAlergia(dynamic data);
  Future deleteAlergia(dynamic data);
  Future<void> editAlergia(dynamic data);
  Future get getTiposAlergia;
}
