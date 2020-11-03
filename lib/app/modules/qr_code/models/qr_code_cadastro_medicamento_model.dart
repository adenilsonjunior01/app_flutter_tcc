class QrCodeCadastroMedicamentoModel {
  String desc;
  String code;

  QrCodeCadastroMedicamentoModel({this.desc, this.code});

  QrCodeCadastroMedicamentoModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['code'] = this.code;
    return data;
  }
}
