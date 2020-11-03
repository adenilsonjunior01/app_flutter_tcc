class Usuario {
  List<String> perfis;
  String sub;
  String dtCadastro;
  String nome;
  int expiration;

  Usuario({this.perfis, this.sub, this.dtCadastro, this.nome, this.expiration});

  Usuario.fromJson(Map<String, dynamic> json) {
    perfis = json['perfis'].cast<String>();
    sub = json['sub'];
    dtCadastro = json['dtCadastro'];
    nome = json['nome'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['perfis'] = this.perfis;
    data['sub'] = this.sub;
    data['dtCadastro'] = this.dtCadastro;
    data['nome'] = this.nome;
    data['expiration'] = this.expiration;
    return data;
  }
}
