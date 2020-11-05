import 'package:app_tcc/app/modules/registros/models/registros_model.dart';

class Alergias {
  int id;
  String descAlergia;
  TipoAlergia tipoAlergia;
  String profissionalSaude;

  Alergias(
      {this.id, this.descAlergia, this.tipoAlergia, this.profissionalSaude});

  Alergias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descAlergia = json['descAlergia'];
    profissionalSaude = json['profissionalSaude'];
    tipoAlergia = json['tipoAlergia'] != null
        ? new TipoAlergia.fromJson(json['tipoAlergia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descAlergia'] = this.descAlergia;
    data['profissionalSaude'] = this.profissionalSaude;
    if (this.tipoAlergia != null) {
      data['tipoAlergia'] = this.tipoAlergia.toJson();
    }
    return data;
  }
}
