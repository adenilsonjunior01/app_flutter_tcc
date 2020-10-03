class CreateUserModel {
  String email;
  String nome;
  String dtNascimento;
  String sexo;
  String senha;
  String telefone;

  CreateUserModel(
      {this.email,
      this.nome,
      this.dtNascimento,
      this.sexo,
      this.senha,
      this.telefone});

  CreateUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    nome = json['nome'];
    dtNascimento = json['dtNascimento'];
    sexo = json['sexo'];
    senha = json['senha'];
    telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['nome'] = this.nome;
    data['dtNascimento'] = this.dtNascimento;
    data['sexo'] = this.sexo;
    data['senha'] = this.senha;
    data['telefone'] = this.telefone;
    return data;
  }
}
