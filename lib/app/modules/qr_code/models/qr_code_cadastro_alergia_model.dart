class QrCodeCadastroAlergiaModel {
  String descAlergia;
  String code;

  QrCodeCadastroAlergiaModel({this.descAlergia, this.code});

  QrCodeCadastroAlergiaModel.fromJson(Map<String, dynamic> json) {
    descAlergia = json['descAlergia'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['descAlergia'] = this.descAlergia;
    data['code'] = this.code;
    return data;
  }
}
