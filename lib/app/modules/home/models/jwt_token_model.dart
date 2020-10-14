class JWTTokenModel {
  String sub;
  String dtCadastro;
  String nome;
  int expiration;

  JWTTokenModel({this.sub, this.dtCadastro, this.nome, this.expiration});

  JWTTokenModel.fromJson(Map<String, dynamic> json) {
    sub = json['sub'];
    dtCadastro = json['dtCadastro'];
    nome = json['nome'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub'] = this.sub;
    data['dtCadastro'] = this.dtCadastro;
    data['nome'] = this.nome;
    data['expiration'] = this.expiration;
    return data;
  }
}
