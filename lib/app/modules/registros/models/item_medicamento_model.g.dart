// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_medicamento_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemMedicamentoModel on _ItemMedicamentoModelBase, Store {
  final _$descricaoAtom = Atom(name: '_ItemMedicamentoModelBase.descricao');

  @override
  String get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  final _$checkAtom = Atom(name: '_ItemMedicamentoModelBase.check');

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

  final _$_ItemMedicamentoModelBaseActionController =
      ActionController(name: '_ItemMedicamentoModelBase');

  @override
  dynamic setDescricao(String value) {
    final _$actionInfo = _$_ItemMedicamentoModelBaseActionController
        .startAction(name: '_ItemMedicamentoModelBase.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_ItemMedicamentoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setChcek(bool value) {
    final _$actionInfo = _$_ItemMedicamentoModelBaseActionController
        .startAction(name: '_ItemMedicamentoModelBase.setChcek');
    try {
      return super.setChcek(value);
    } finally {
      _$_ItemMedicamentoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getDescricao() {
    final _$actionInfo = _$_ItemMedicamentoModelBaseActionController
        .startAction(name: '_ItemMedicamentoModelBase.getDescricao');
    try {
      return super.getDescricao();
    } finally {
      _$_ItemMedicamentoModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descricao: ${descricao},
check: ${check}
    ''';
  }
}
