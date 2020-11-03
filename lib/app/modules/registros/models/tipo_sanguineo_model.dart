class TipoSanguineoModel {
  int id;
  String descricaoTipoSanguineo;

  TipoSanguineoModel({this.id, this.descricaoTipoSanguineo});

  TipoSanguineoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descricaoTipoSanguineo = json['descricaoTipoSanguineo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descricaoTipoSanguineo'] = this.descricaoTipoSanguineo;
    return data;
  }
}
