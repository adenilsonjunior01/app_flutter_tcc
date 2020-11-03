class QrCodeCadastroProcedimentoMedicoModel {
  String titulo;
  String code;
  String descLocal;
  String dtRetorno;
  String dtProcedimento;
  int idTipoProcedimento;

  QrCodeCadastroProcedimentoMedicoModel(
      {this.titulo,
      this.code,
      this.descLocal,
      this.dtRetorno,
      this.dtProcedimento,
      this.idTipoProcedimento});

  QrCodeCadastroProcedimentoMedicoModel.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    code = json['code'];
    descLocal = json['descLocal'];
    dtRetorno = json['dtRetorno'];
    dtProcedimento = json['dtProcedimento'];
    idTipoProcedimento = json['idTipoProcedimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['code'] = this.code;
    data['descLocal'] = this.descLocal;
    data['dtRetorno'] = this.dtRetorno;
    data['dtProcedimento'] = this.dtProcedimento;
    data['idTipoProcedimento'] = this.idTipoProcedimento;
    return data;
  }
}
