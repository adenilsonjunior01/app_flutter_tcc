class GetProcedimentoMedicoModel {
  int id;
  String titulo;
  String descLocal;
  String descricao;
  String dtRegistro;
  String dtRetorno;
  String dtProcedimento;
  String nomeUsuario;
  String descTipoProcedimento;
  String nomeProfSaude;

  GetProcedimentoMedicoModel(
      {this.id,
      this.titulo,
      this.descLocal,
      this.descricao,
      this.dtRegistro,
      this.dtRetorno,
      this.dtProcedimento,
      this.nomeUsuario,
      this.descTipoProcedimento,
      this.nomeProfSaude});

  GetProcedimentoMedicoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descLocal = json['descLocal'];
    descricao = json['descricao'];
    dtRegistro = json['dtRegistro'];
    dtRetorno = json['dtRetorno'];
    dtProcedimento = json['dtProcedimento'];
    nomeUsuario = json['nomeUsuario'];
    descTipoProcedimento = json['descTipoProcedimento'];
    nomeProfSaude = json['nomeProfSaude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['titulo'] = this.titulo;
    data['descLocal'] = this.descLocal;
    data['descricao'] = this.descricao;
    data['dtRegistro'] = this.dtRegistro;
    data['dtRetorno'] = this.dtRetorno;
    data['dtProcedimento'] = this.dtProcedimento;
    data['nomeUsuario'] = this.nomeUsuario;
    data['nomeProfSaude'] = this.nomeProfSaude;
    return data;
  }
}
