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
  final _$listItemsAtom = Atom(name: '_DoencaCronicaControllerBase.listItems');

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

  final _$_DoencaCronicaControllerBaseActionController =
      ActionController(name: '_DoencaCronicaControllerBase');

  @override
  dynamic addItem({dynamic item}) {
    final _$actionInfo = _$_DoencaCronicaControllerBaseActionController
        .startAction(name: '_DoencaCronicaControllerBase.addItem');
    try {
      return super.addItem(item: item);
    } finally {
      _$_DoencaCronicaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(ItemModel model) {
    final _$actionInfo = _$_DoencaCronicaControllerBaseActionController
        .startAction(name: '_DoencaCronicaControllerBase.removeItem');
    try {
      return super.removeItem(model);
    } finally {
      _$_DoencaCronicaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addLastItem(ItemModel item) {
    final _$actionInfo = _$_DoencaCronicaControllerBaseActionController
        .startAction(name: '_DoencaCronicaControllerBase.addLastItem');
    try {
      return super.addLastItem(item);
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
listItems: ${listItems}
    ''';
  }
}
