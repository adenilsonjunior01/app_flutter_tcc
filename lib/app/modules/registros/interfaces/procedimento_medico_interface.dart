import 'package:app_tcc/app/modules/registros/models/procedimento_medico_model.dart';

abstract class IProcedimentoMedicoRepository {
  Future get getProcedimentoMedico;
  Future deleteProcedimentoMedico(dynamic data);
  Future editProcedimentoMedico(dynamic data);
  Future<ProcedimentoMedicoModel> cadastroProcedimentoMedico(dynamic data);
  Future get getTipoProcedimentoMedico;
}
