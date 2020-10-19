import 'dart:convert';

import 'package:app_tcc/app/modules/home/models/jwt_token_model.dart';
import 'package:app_tcc/app/modules/profile/profile_status_request.dart';
import 'package:app_tcc/app/modules/profile/repositories/profile_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_controller.g.dart';

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  GlobalKey<FormBuilderState> formBuilderKey = GlobalKey<FormBuilderState>();
  TextEditingController nameUser = TextEditingController();
  TextEditingController telUser = TextEditingController();

  final ProfileRepository repository;

  _ProfileControllerBase(this.repository);

  @observable
  String users = '';

  @observable
  String firstLetter = '';

  @observable
  String email = '';

  @observable
  ProfileStatusRequest status = ProfileStatusRequest.none;

  @action
  Future jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jwtToken = prefs.getString('token');
    Map<String, dynamic> tokenDecode = JwtDecoder.decode(jwtToken);
    JWTTokenModel user = JWTTokenModel.fromJson(tokenDecode);
    users = user.nome;
    email = user.sub;
    firstLetter = users[0].toUpperCase();
    print(email);
  }

  @action
  Future editUser(BuildContext context) async {
    Map<String, dynamic> params = {
      'email': null,
      'nome': nameUser.text != '' ? nameUser.text : null,
      'dtNascimento': null,
      'sexo': null,
      'senha': null,
      'telefone': telUser.text != '' ? telUser.text : null
    };

    var body = jsonEncode(params);
    status = ProfileStatusRequest.loading;
    try {
      final user = await repository.editUser(body);
      status = ProfileStatusRequest.success..value = user;
      clearInputDesMedicamento();
    } catch (e) {
      status = ProfileStatusRequest.error..value = e;
    }
  }

  @action
  clearInputDesMedicamento() {
    nameUser.text = '';
    telUser.text = '';
  }
}
