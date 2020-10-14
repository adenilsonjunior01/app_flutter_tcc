// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_medicamento_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ItemMedicamentoModel on _ItemMedicamentoModelBase, Store {
  final _$descMedicamentoAtom =
      Atom(name: '_ItemMedicamentoModelBase.descMedicamento');

  @override
  String get descMedicamento {
    _$descMedicamentoAtom.reportRead();
    return super.descMedicamento;
  }

  @override
  set descMedicamento(String value) {
    _$descMedicamentoAtom.reportWrite(value, super.descMedicamento, () {
      super.descMedicamento = value;
    });
  }

  final _$idAtom = Atom(name: '_ItemMedicamentoModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
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
  dynamic setChcek(int value) {
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
descMedicamento: ${descMedicamento},
id: ${id}
    ''';
  }
}
