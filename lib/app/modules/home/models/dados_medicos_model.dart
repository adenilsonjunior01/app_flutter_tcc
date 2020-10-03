import 'package:app_tcc/app/modules/registros/models/medicamento_model.dart';

class DadosMedicosModel {
  int id;
  String tipoSanguineo;
  String dtAtualizacao;
  List<Null> doencasCronicas;
  List<MedicamentoModel> medicamentos;
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
    // if (json['doencasCronicas'] != null) {
    //   doencasCronicas = new List<Null>();
    //   json['doencasCronicas'].forEach((v) {
    //     doencasCronicas.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['medicamentos'] != null) {
    //   medicamentos = new List<Null>();
    //   json['medicamentos'].forEach((v) {
    //     medicamentos.add(new Null.fromJson(v));
    //   });
    // }
    // if (json['alergias'] != null) {
    //   alergias = new List<Null>();
    //   json['alergias'].forEach((v) {
    //     alergias.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tipoSanguineo'] = this.tipoSanguineo;
    data['dt_atualizacao'] = this.dtAtualizacao;
    // if (this.doencasCronicas != null) {
    //   data['doencasCronicas'] =
    //       this.doencasCronicas.map((v) => v.toJson()).toList();
    // }
    if (this.medicamentos != null) {
      data['medicamentos'] = this.medicamentos.map((v) => v.toJson()).toList();
    }
    // if (this.alergias != null) {
    //   data['alergias'] = this.alergias.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}
