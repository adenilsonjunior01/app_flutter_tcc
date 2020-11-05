class Medicamentos {
  int id;
  String descMedicamento;
  String dtRegistro;
  String profissionalSaude;

  Medicamentos(
      {this.id, this.descMedicamento, this.dtRegistro, this.profissionalSaude});

  Medicamentos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descMedicamento = json['descMedicamento'];
    dtRegistro = json['dtRegistro'];
    profissionalSaude = json['profissionalSaude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descMedicamento'] = this.descMedicamento;
    data['dtRegistro'] = this.dtRegistro;
    data['profissionalSaude'] = this.profissionalSaude;
    return data;
  }
}
