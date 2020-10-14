import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserAuthModel extends Model {
  String token;

  UserAuthModel({this.token});

  UserAuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}
