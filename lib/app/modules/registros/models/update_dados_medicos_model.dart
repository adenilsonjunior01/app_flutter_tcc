class UpdateDadosMedicosModel {
  int tipoSanguineo;
  double altura;
  int peso;

  UpdateDadosMedicosModel({this.tipoSanguineo, this.altura, this.peso});

  UpdateDadosMedicosModel.fromJson(Map<String, dynamic> json) {
    tipoSanguineo = json['tipoSanguineo'];
    altura = json['altura'];
    peso = json['peso'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tipoSanguineo'] = this.tipoSanguineo;
    data['altura'] = this.altura;
    data['peso'] = this.peso;
    return data;
  }
}
