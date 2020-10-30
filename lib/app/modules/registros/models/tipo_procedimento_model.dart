class TipoProcedimentoModel {
  int id;
  String descTipoProcedimeto;

  TipoProcedimentoModel({this.id, this.descTipoProcedimeto});

  TipoProcedimentoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descTipoProcedimeto = json['descTipoProcedimeto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descTipoProcedimeto'] = this.descTipoProcedimeto;
    return data;
  }
}
