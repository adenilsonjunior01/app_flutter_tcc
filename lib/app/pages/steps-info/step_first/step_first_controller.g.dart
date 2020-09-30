// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_first_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $StepFirstController = BindInject(
  (i) => StepFirstController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StepFirstController on _StepFirstControllerBase, Store {
  final _$valueAtom = Atom(name: '_StepFirstControllerBase.value');

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

  final _$_StepFirstControllerBaseActionController =
      ActionController(name: '_StepFirstControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_StepFirstControllerBaseActionController.startAction(
        name: '_StepFirstControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_StepFirstControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic navegateSecondPage(BuildContext context) {
    final _$actionInfo = _$_StepFirstControllerBaseActionController.startAction(
        name: '_StepFirstControllerBase.navegateSecondPage');
    try {
      return super.navegateSecondPage(context);
    } finally {
      _$_StepFirstControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic skipStep(BuildContext context) {
    final _$actionInfo = _$_StepFirstControllerBaseActionController.startAction(
        name: '_StepFirstControllerBase.skipStep');
    try {
      return super.skipStep(context);
    } finally {
      _$_StepFirstControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
