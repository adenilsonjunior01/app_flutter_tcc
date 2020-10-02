// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resetar_senha_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ResetarSenhaController = BindInject(
  (i) => ResetarSenhaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ResetarSenhaController on _ResetarSenhaControllerBase, Store {
  final _$valueAtom = Atom(name: '_ResetarSenhaControllerBase.value');

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

  final _$_ResetarSenhaControllerBaseActionController =
      ActionController(name: '_ResetarSenhaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_ResetarSenhaControllerBaseActionController
        .startAction(name: '_ResetarSenhaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_ResetarSenhaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_ResetarSenhaControllerBaseActionController
        .startAction(name: '_ResetarSenhaControllerBase.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_ResetarSenhaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
