class DoencasCronicas {
  int id;
  String descDoenca;
  String profissionalSaude;

  DoencasCronicas({this.id, this.descDoenca, this.profissionalSaude});

  DoencasCronicas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descDoenca = json['descDoenca'];
    profissionalSaude = json['profissionalSaude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descDoenca'] = this.descDoenca;
    data['profissionalSaude'] = this.profissionalSaude;
    return data;
  }
}
