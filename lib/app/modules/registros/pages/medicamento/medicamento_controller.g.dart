// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MedicamentoController = BindInject(
  (i) => MedicamentoController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MedicamentoController on _MedicamentoControllerBase, Store {
  final _$valueAtom = Atom(name: '_MedicamentoControllerBase.value');

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

  final _$listItemsAtom = Atom(name: '_MedicamentoControllerBase.listItems');

  @override
  ObservableList<ItemModel> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(ObservableList<ItemModel> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  final _$_MedicamentoControllerBaseActionController =
      ActionController(name: '_MedicamentoControllerBase');

  @override
  dynamic addItem({dynamic item}) {
    final _$actionInfo = _$_MedicamentoControllerBaseActionController
        .startAction(name: '_MedicamentoControllerBase.addItem');
    try {
      return super.addItem(item: item);
    } finally {
      _$_MedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ItemModel model) {
    final _$actionInfo = _$_MedicamentoControllerBaseActionController
        .startAction(name: '_MedicamentoControllerBase.removeItem');
    try {
      return super.removeItem(model);
    } finally {
      _$_MedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addLastItem(ItemModel item) {
    final _$actionInfo = _$_MedicamentoControllerBaseActionController
        .startAction(name: '_MedicamentoControllerBase.addLastItem');
    try {
      return super.addLastItem(item);
    } finally {
      _$_MedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_MedicamentoControllerBaseActionController
        .startAction(name: '_MedicamentoControllerBase.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_MedicamentoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
listItems: ${listItems}
    ''';
  }
}
