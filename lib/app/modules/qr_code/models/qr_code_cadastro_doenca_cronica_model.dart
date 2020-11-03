class QrCodeCadastroDoencaCronicaModel {
  String descDoenca;
  String code;

  QrCodeCadastroDoencaCronicaModel({this.descDoenca, this.code});

  QrCodeCadastroDoencaCronicaModel.fromJson(Map<String, dynamic> json) {
    descDoenca = json['descDoenca'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descDoenca'] = this.descDoenca;
    data['code'] = this.code;
    return data;
  }
}
