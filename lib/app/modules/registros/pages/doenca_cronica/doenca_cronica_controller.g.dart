// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doenca_cronica_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DoencaCronicaController = BindInject(
  (i) => DoencaCronicaController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoencaCronicaController on _DoencaCronicaControllerBase, Store {
  final _$valueAtom = Atom(name: '_DoencaCronicaControllerBase.value');

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

  final _$_DoencaCronicaControllerBaseActionController =
      ActionController(name: '_DoencaCronicaControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_DoencaCronicaControllerBaseActionController
        .startAction(name: '_DoencaCronicaControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_DoencaCronicaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_DoencaCronicaControllerBaseActionController
        .startAction(name: '_DoencaCronicaControllerBase.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_DoencaCronicaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
