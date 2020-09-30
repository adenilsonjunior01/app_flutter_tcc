// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_second_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StepSecondController = BindInject(
  (i) => StepSecondController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepSecondController on _StepSecondControllerBase, Store {
  final _$valueAtom = Atom(name: '_StepSecondControllerBase.value');

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

  final _$_StepSecondControllerBaseActionController =
      ActionController(name: '_StepSecondControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StepSecondControllerBaseActionController
        .startAction(name: '_StepSecondControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StepSecondControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navegateLoginPage(BuildContext context) {
    final _$actionInfo = _$_StepSecondControllerBaseActionController
        .startAction(name: '_StepSecondControllerBase.navegateLoginPage');
    try {
      return super.navegateLoginPage(context);
    } finally {
      _$_StepSecondControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic skipStep(BuildContext context) {
    final _$actionInfo = _$_StepSecondControllerBaseActionController
        .startAction(name: '_StepSecondControllerBase.skipStep');
    try {
      return super.skipStep(context);
    } finally {
      _$_StepSecondControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
