import 'package:app_tcc/app/modules/registros/models/registros_model.dart';

abstract class IMedicamentoRepository {
  Future get getMedicamentoFuture;
  Future<Medicamentos> registerNewMedicamento(dynamic data);
  Future deleteMedicamento(dynamic data);
  Future<void> editMedicamento(dynamic data);
}
