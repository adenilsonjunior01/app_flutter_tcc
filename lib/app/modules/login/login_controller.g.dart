// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LoginController = BindInject(
  (i) => LoginController(i<AuthRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$valueAtom = Atom(name: '_LoginControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$statusAtom = Atom(name: '_LoginControllerBase.status');

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

  final _$submitFormAsyncAction =
      AsyncAction('_LoginControllerBase.submitForm');

  @override
  Future<void> submitForm(BuildContext context) {
    return _$submitFormAsyncAction.run(() => super.submitForm(context));
  }

  final _$_navegaHomePageAsyncAction =
      AsyncAction('_LoginControllerBase._navegaHomePage');

  @override
  Future _navegaHomePage(BuildContext context) {
    return _$_navegaHomePageAsyncAction
        .run(() => super._navegaHomePage(context));
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navegateResetarSenha(BuildContext context) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.navegateResetarSenha');
    try {
      return super.navegateResetarSenha(context);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navegaRegisterUserPage(BuildContext context) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.navegaRegisterUserPage');
    try {
      return super.navegaRegisterUserPage(context);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initInputs() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.initInputs');
    try {
      return super.initInputs();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
status: ${status}
    ''';
  }
}
