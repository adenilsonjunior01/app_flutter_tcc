class DadosMedicosModel {
  int id;
  TipoSanguineo tipoSanguineo;
  String dtAtualizacao;
  List<DoencasCronicas> doencasCronicas;
  List<DoencasCronicas> medicamentos;
  List<Alergias> alergias;

  DadosMedicosModel(
      {this.id,
      this.tipoSanguineo,
      this.dtAtualizacao,
      this.doencasCronicas,
      this.medicamentos,
      this.alergias});

  DadosMedicosModel.fromJson(Map<String, dynamic> json) {
    if (json['medicamentos'] != null) {
      medicamentos = new List<DoencasCronicas>();
      json['DoencasCronicas'].forEach((v) {
        medicamentos.add(new DoencasCronicas.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.tipoSanguineo != null) {
      data['tipoSanguineo'] = this.tipoSanguineo.toJson();
    }
    data['dt_atualizacao'] = this.dtAtualizacao;
    if (this.doencasCronicas != null) {
      data['doencasCronicas'] =
          this.doencasCronicas.map((v) => v.toJson()).toList();
    }
    if (this.medicamentos != null) {
      data['medicamentos'] = this.medicamentos.map((v) => v.toJson()).toList();
    }
    if (this.alergias != null) {
      data['alergias'] = this.alergias.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipoSanguineo {
  int id;
  String descricaoTipoSanguineo;

  TipoSanguineo({this.id, this.descricaoTipoSanguineo});

  TipoSanguineo.fromJson(Map<String, dynamic> json) {
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

class DoencasCronicas {
  int id;
  String descMedicamento;

  DoencasCronicas({this.id, this.descMedicamento});

  DoencasCronicas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descMedicamento = json['descMedicamento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descMedicamento'] = this.descMedicamento;
    return data;
  }
}

class Alergias {
  int id;
  String descAlergia;
  TipoAlergia tipoAlergia;

  Alergias({this.id, this.descAlergia, this.tipoAlergia});

  Alergias.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descAlergia = json['descAlergia'];
    tipoAlergia = json['tipoAlergia'] != null
        ? new TipoAlergia.fromJson(json['tipoAlergia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descAlergia'] = this.descAlergia;
    if (this.tipoAlergia != null) {
      data['tipoAlergia'] = this.tipoAlergia.toJson();
    }
    return data;
  }
}

class TipoAlergia {
  int id;
  String descTipo;

  TipoAlergia({this.id, this.descTipo});

  TipoAlergia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descTipo = json['descTipo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descTipo'] = this.descTipo;
    return data;
  }
}
