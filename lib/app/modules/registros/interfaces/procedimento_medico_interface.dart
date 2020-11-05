abstract class IProcedimentoMedicoRepository {
  Future get getProcedimentoMedico;
  Future deleteProcedimentoMedico(dynamic data);
  Future editProcedimentoMedico(dynamic data);
  Future cadastroProcedimentoMedico(dynamic data);
  Future get getTipoProcedimentoMedico;
}
