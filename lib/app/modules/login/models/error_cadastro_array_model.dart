class ErrorCadastroArrayModel {
  int status;
  String message;
  int timeStamp;
  List<Errors> errors;

  ErrorCadastroArrayModel(
      {this.status, this.message, this.timeStamp, this.errors});

  ErrorCadastroArrayModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    timeStamp = json['timeStamp'];
    if (json['errors'] != null) {
      errors = new List<Errors>();
      json['errors'].forEach((v) {
        errors.add(new Errors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['timeStamp'] = this.timeStamp;
    if (this.errors != null) {
      data['errors'] = this.errors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Errors {
  String nomeCampo;
  String mensagem;

  Errors({this.nomeCampo, this.mensagem});

  Errors.fromJson(Map<String, dynamic> json) {
    nomeCampo = json['nomeCampo'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nomeCampo'] = this.nomeCampo;
    data['mensagem'] = this.mensagem;
    return data;
  }
}
