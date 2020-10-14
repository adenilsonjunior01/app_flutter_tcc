import 'package:app_tcc/app/modules/registros/models/registros_model.dart';

abstract class IDoencaCronicaRepository {
  Future get getDoencaCronicaFuture;
  Future<DoencasCronicas> registerNewDoencaCronica(dynamic data);
  Future deleteDoencaCronica(dynamic data);
  Future<void> editDoencaCronica(dynamic data);
}
