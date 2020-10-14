import 'package:app_tcc/app/modules/registros/models/registros_model.dart';

class DadosMedicosModel {
  int id;
  String tipoSanguineo;
  String dtAtualizacao;
  List<Null> doencasCronicas;
  List<RegistrosModel> medicamentos;
  List<Null> alergias;

  DadosMedicosModel(
      {this.id,
      this.tipoSanguineo,
      this.dtAtualizacao,
      this.doencasCronicas,
      this.medicamentos,
      this.alergias});

  DadosMedicosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoSanguineo = json['tipoSanguineo'];
    dtAtualizacao = json['dt_atualizacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipoSanguineo'] = this.tipoSanguineo;
    data['dt_atualizacao'] = this.dtAtualizacao;

    if (this.medicamentos != null) {
      data['medicamentos'] = this.medicamentos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
