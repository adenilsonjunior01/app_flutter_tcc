class DadosMedicosModel {
  int id;
  TipoSanguineo tipoSanguineo;
  String dtAtualizacao;
  List<DoencasCronicas> doencasCronicas;
  List<Medicamentos> medicamentos;
  var peso;
  var altura;
  var vlImc;
  var descImc;
  var nomeProfissionalSaude;
  List<Alergias> alergias;

  DadosMedicosModel(
      {this.id,
      this.tipoSanguineo,
      this.dtAtualizacao,
      this.doencasCronicas,
      this.medicamentos,
      this.peso,
      this.altura,
      this.vlImc,
      this.descImc,
      this.nomeProfissionalSaude,
      this.alergias});

  DadosMedicosModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tipoSanguineo = json['tipoSanguineo'] != null
        ? new TipoSanguineo.fromJson(json['tipoSanguineo'])
        : null;
    dtAtualizacao = json['dtAtualizacao'];
    if (json['doencasCronicas'] != null) {
      doencasCronicas = new List<DoencasCronicas>();
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
    peso = json['peso'];
    altura = json['altura'];
    vlImc = json['vlImc'];
    descImc = json['descImc'];
    nomeProfissionalSaude = json['nomeProfissionalSaude'];
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
    data['dtAtualizacao'] = this.dtAtualizacao;
    if (this.doencasCronicas != null) {
      data['doencasCronicas'] =
          this.doencasCronicas.map((v) => v.toJson()).toList();
    }
    if (this.medicamentos != null) {
      data['medicamentos'] = this.medicamentos.map((v) => v.toJson()).toList();
    }
    data['peso'] = this.peso;
    data['altura'] = this.altura;
    data['vlImc'] = this.vlImc;
    data['descImc'] = this.descImc;
    data['nomeProfissionalSaude'] = this.nomeProfissionalSaude;
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
  String descDoenca;

  DoencasCronicas({this.id, this.descDoenca});

  DoencasCronicas.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descDoenca = json['descDoenca'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descDoenca'] = this.descDoenca;
    return data;
  }
}

class Medicamentos {
  int id;
  String descMedicamento;
  String dtRegistro;

  Medicamentos({this.id, this.descMedicamento, this.dtRegistro});

  Medicamentos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    descMedicamento = json['descMedicamento'];
    dtRegistro = json['dtRegistro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['descMedicamento'] = this.descMedicamento;
    data['dtRegistro'] = this.dtRegistro;
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
