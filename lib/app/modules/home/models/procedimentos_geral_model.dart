class ProcedimentosGeralModel {
  int total;
  Quantidade quantidade;

  ProcedimentosGeralModel({this.total, this.quantidade});

  ProcedimentosGeralModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    quantidade = json['quantidade'] != null
        ? new Quantidade.fromJson(json['quantidade'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.quantidade != null) {
      data['quantidade'] = this.quantidade.toJson();
    }
    return data;
  }
}

class Quantidade {
  int exame;
  int consultaMDica;
  int cirurgia;

  Quantidade({this.exame, this.consultaMDica, this.cirurgia});

  Quantidade.fromJson(Map<String, dynamic> json) {
    exame = json['Exame'];
    consultaMDica = json['Consulta médica'];
    cirurgia = json['Cirurgia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Exame'] = this.exame;
    data['Consulta médica'] = this.consultaMDica;
    data['Cirurgia'] = this.cirurgia;
    return data;
  }
}
