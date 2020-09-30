// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alergia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AlergiaController = BindInject(
  (i) => AlergiaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlergiaController on _AlergiaControllerBase, Store {
  final _$valueAtom = Atom(name: '_AlergiaControllerBase.value');

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

  final _$_AlergiaControllerBaseActionController =
      ActionController(name: '_AlergiaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_AlergiaControllerBaseActionController.startAction(
        name: '_AlergiaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_AlergiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_AlergiaControllerBaseActionController.startAction(
        name: '_AlergiaControllerBase.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_AlergiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
