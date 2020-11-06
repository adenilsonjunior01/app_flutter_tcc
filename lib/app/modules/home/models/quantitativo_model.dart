class QuantitativoModel {
  int procedimentos;
  int doencas;
  int medicamentos;
  int alergias;

  QuantitativoModel(
      {this.procedimentos, this.doencas, this.medicamentos, this.alergias});

  QuantitativoModel.fromJson(Map<String, dynamic> json) {
    procedimentos = json['procedimentos'];
    doencas = json['doencas'];
    medicamentos = json['medicamentos'];
    alergias = json['alergias'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['procedimentos'] = this.procedimentos;
    data['doencas'] = this.doencas;
    data['medicamentos'] = this.medicamentos;
    data['alergias'] = this.alergias;
    return data;
  }
}
