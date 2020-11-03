abstract class IDadosMedicosRepository {
  Future get getTipoSanguineo;
  Future editDadosMedicos(dynamic data);
  Future get getDadosMedicos;
  Future get getTipoAlergias;

  Future editMedicamento(dynamic data);
  Future editDoencaCronica(dynamic data);
  Future editAlergia(dynamic data);
}
