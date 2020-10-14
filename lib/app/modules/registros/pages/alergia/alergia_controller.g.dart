// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alergia_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $AlergiaController = BindInject(
  (i) => AlergiaController(i<IAlergiaRepostory>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlergiaController on _AlergiaControllerBase, Store {
  final _$tipoAlergiaAtom = Atom(name: '_AlergiaControllerBase.tipoAlergia');

  @override
  dynamic get tipoAlergia {
    _$tipoAlergiaAtom.reportRead();
    return super.tipoAlergia;
  }

  @override
  set tipoAlergia(dynamic value) {
    _$tipoAlergiaAtom.reportWrite(value, super.tipoAlergia, () {
      super.tipoAlergia = value;
    });
  }

  final _$newTipoAlergiaAtom =
      Atom(name: '_AlergiaControllerBase.newTipoAlergia');

  @override
  dynamic get newTipoAlergia {
    _$newTipoAlergiaAtom.reportRead();
    return super.newTipoAlergia;
  }

  @override
  set newTipoAlergia(dynamic value) {
    _$newTipoAlergiaAtom.reportWrite(value, super.newTipoAlergia, () {
      super.newTipoAlergia = value;
    });
  }

  final _$listItemsAtom = Atom(name: '_AlergiaControllerBase.listItems');

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

  final _$statusAtom = Atom(name: '_AlergiaControllerBase.status');

  @override
  RegistroStatusRequest get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(RegistroStatusRequest value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$listAlergiasAtom = Atom(name: '_AlergiaControllerBase.listAlergias');

  @override
  ObservableList<dynamic> get listAlergias {
    _$listAlergiasAtom.reportRead();
    return super.listAlergias;
  }

  @override
  set listAlergias(ObservableList<dynamic> value) {
    _$listAlergiasAtom.reportWrite(value, super.listAlergias, () {
      super.listAlergias = value;
    });
  }

  final _$listTiposAlergiaAtom =
      Atom(name: '_AlergiaControllerBase.listTiposAlergia');

  @override
  ObservableList<dynamic> get listTiposAlergia {
    _$listTiposAlergiaAtom.reportRead();
    return super.listTiposAlergia;
  }

  @override
  set listTiposAlergia(ObservableList<dynamic> value) {
    _$listTiposAlergiaAtom.reportWrite(value, super.listTiposAlergia, () {
      super.listTiposAlergia = value;
    });
  }

  final _$removeItemAsyncAction =
      AsyncAction('_AlergiaControllerBase.removeItem');

  @override
  Future removeItem(dynamic item, BuildContext context) {
    return _$removeItemAsyncAction.run(() => super.removeItem(item, context));
  }

  final _$editItemAsyncAction = AsyncAction('_AlergiaControllerBase.editItem');

  @override
  Future editItem(dynamic item, dynamic context) {
    return _$editItemAsyncAction.run(() => super.editItem(item, context));
  }

  final _$submitFormAsyncAction =
      AsyncAction('_AlergiaControllerBase.submitForm');

  @override
  Future<void> submitForm(BuildContext context) {
    return _$submitFormAsyncAction.run(() => super.submitForm(context));
  }

  final _$_AlergiaControllerBaseActionController =
      ActionController(name: '_AlergiaControllerBase');

  @override
  dynamic addItem({dynamic item}) {
    final _$actionInfo = _$_AlergiaControllerBaseActionController.startAction(
        name: '_AlergiaControllerBase.addItem');
    try {
      return super.addItem(item: item);
    } finally {
      _$_AlergiaControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addLastItem(ItemModel item) {
    final _$actionInfo = _$_AlergiaControllerBaseActionController.startAction(
        name: '_AlergiaControllerBase.addLastItem');
    try {
      return super.addLastItem(item);
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
tipoAlergia: ${tipoAlergia},
newTipoAlergia: ${newTipoAlergia},
listItems: ${listItems},
status: ${status},
listAlergias: ${listAlergias},
listTiposAlergia: ${listTiposAlergia}
    ''';
  }
}
