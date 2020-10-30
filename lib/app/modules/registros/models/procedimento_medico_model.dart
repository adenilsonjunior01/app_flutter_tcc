class ProcedimentoMedicoModel {
  String titulo;
  String descLocal;
  String dtRetorno;
  String dtProcedimento;
  String descricao;
  int idTipoProcedimento;

  ProcedimentoMedicoModel(
      {this.titulo,
      this.descLocal,
      this.dtRetorno,
      this.dtProcedimento,
      this.descricao,
      this.idTipoProcedimento});

  ProcedimentoMedicoModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    descLocal = json['descLocal'];
    dtRetorno = json['dtRetorno'];
    dtProcedimento = json['dtProcedimento'];
    descricao = json['descricao'];
    idTipoProcedimento = json['idTipoProcedimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['descLocal'] = this.descLocal;
    data['dtRetorno'] = this.dtRetorno;
    data['dtProcedimento'] = this.dtProcedimento;
    data['descricao'] = this.descricao;
    data['idTipoProcedimento'] = this.idTipoProcedimento;
    return data;
  }
}
