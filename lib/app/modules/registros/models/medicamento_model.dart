class MedicamentoModel {
  var desc;

  MedicamentoModel({this.desc});

  MedicamentoModel.fromJson(Map<String, dynamic> json) {
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    return data;
  }

  Map toJson2(String desc) {
    return {'desc': desc};
  }
}
