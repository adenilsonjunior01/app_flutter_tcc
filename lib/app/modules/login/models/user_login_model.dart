class UserLoginModel {
  String email;
  String senha;

  UserLoginModel({this.email, this.senha});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}
