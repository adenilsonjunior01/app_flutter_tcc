// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EditProfileController = BindInject(
  (i) => EditProfileController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EditProfileController on _EditProfileControllerBase, Store {
  final _$valueAtom = Atom(name: '_EditProfileControllerBase.value');

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

  final _$_EditProfileControllerBaseActionController =
      ActionController(name: '_EditProfileControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_EditProfileControllerBaseActionController
        .startAction(name: '_EditProfileControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_EditProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
