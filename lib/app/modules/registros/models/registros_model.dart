class RegistrosModel {
  int id;
  TipoSanguineo tipoSanguineo;
  String dtAtualizacao;
  List<DoencasCronicas> doencasCronicas;
  List<Medicamentos> medicamentos;
  List<Alergias> alergias;

  RegistrosModel(
      {this.id,
      this.tipoSanguineo,
      this.dtAtualizacao,
      this.doencasCronicas,
      this.medicamentos,
      this.alergias});

  RegistrosModel.fromJson(dynamic json) {
    id = json['id'];
    tipoSanguineo = json['tipoSanguineo'] != null
        ? new TipoSanguineo.fromJson(json['tipoSanguineo'])
        : null;
    dtAtualizacao = json['dt_atualizacao'];
    if (json['doencasCronicas'] != null) {
      doencasCronicas = new List<Null>();
      json['doencasCronicas'].forEach((v) {
        doencasCronicas.add(new DoencasCronicas.fromJson(v));
      });
    }
    if (json['medicamentos'] != null) {
      medicamentos = new List<Medicamentos>();
      json['medicamentos'].forEach((v) {
        medicamentos.add(new Medicamentos.fromJson(v));
      });
    }
    if (json['alergias'] != null) {
      alergias = new List<Alergias>();
      json['alergias'].forEach((v) {
        alergias.add(new Alergias.fromJson(v));
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

class Medicamentos {
  int id;
  String descMedicamento;

  Medicamentos({this.id, this.descMedicamento});

  Medicamentos.fromJson(Map<String, dynamic> json) {
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

class DoencasCronicas {
  int id;
  String descDoencaCronica;

  DoencasCronicas({this.id, this.descDoencaCronica});

  DoencasCronicas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descDoencaCronica = json['descDoencaCronica'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descDoencaCronica'] = this.descDoencaCronica;
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
