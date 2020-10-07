// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_user_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $CadastroUserController = BindInject(
  (i) => CadastroUserController(i<RegisterUserRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroUserController on _CadastroUserControllerBase, Store {
  final _$statusAtom = Atom(name: '_CadastroUserControllerBase.status');

  @override
  LoginStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(LoginStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_CadastroUserControllerBaseActionController =
      ActionController(name: '_CadastroUserControllerBase');

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_CadastroUserControllerBaseActionController
        .startAction(name: '_CadastroUserControllerBase.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_CadastroUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
