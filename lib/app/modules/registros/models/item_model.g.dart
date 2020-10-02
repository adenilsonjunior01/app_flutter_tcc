// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemModel on _ItemModelBase, Store {
  final _$titleAtom = Atom(name: '_ItemModelBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$checkAtom = Atom(name: '_ItemModelBase.check');

  @override
  bool get check {
    _$checkAtom.reportRead();
    return super.check;
  }

  @override
  set check(bool value) {
    _$checkAtom.reportWrite(value, super.check, () {
      super.check = value;
    });
  }

  final _$tipoAtom = Atom(name: '_ItemModelBase.tipo');

  @override
  int get tipo {
    _$tipoAtom.reportRead();
    return super.tipo;
  }

  @override
  set tipo(int value) {
    _$tipoAtom.reportWrite(value, super.tipo, () {
      super.tipo = value;
    });
  }

  final _$_ItemModelBaseActionController =
      ActionController(name: '_ItemModelBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChcek(bool value) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setChcek');
    try {
      return super.setChcek(value);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTipo(int value) {
    final _$actionInfo = _$_ItemModelBaseActionController.startAction(
        name: '_ItemModelBase.setTipo');
    try {
      return super.setTipo(value);
    } finally {
      _$_ItemModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
check: ${check},
tipo: ${tipo}
    ''';
  }
}
