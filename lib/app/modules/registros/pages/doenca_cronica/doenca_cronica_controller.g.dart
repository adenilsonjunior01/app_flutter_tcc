// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doenca_cronica_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DoencaCronicaController = BindInject(
  (i) => DoencaCronicaController(i<IDoencaCronicaRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DoencaCronicaController on _DoencaCronicaControllerBase, Store {
  final _$statusAtom = Atom(name: '_DoencaCronicaControllerBase.status');

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

  final _$oldValueMedicamentoAtom =
      Atom(name: '_DoencaCronicaControllerBase.oldValueMedicamento');

  @override
  DoencasCronicas get oldValueMedicamento {
    _$oldValueMedicamentoAtom.reportRead();
    return super.oldValueMedicamento;
  }

  @override
  set oldValueMedicamento(DoencasCronicas value) {
    _$oldValueMedicamentoAtom.reportWrite(value, super.oldValueMedicamento, () {
      super.oldValueMedicamento = value;
    });
  }

  final _$listDoencaCronicaAtom =
      Atom(name: '_DoencaCronicaControllerBase.listDoencaCronica');

  @override
  ObservableList<DoencasCronicas> get listDoencaCronica {
    _$listDoencaCronicaAtom.reportRead();
    return super.listDoencaCronica;
  }

  @override
  set listDoencaCronica(ObservableList<DoencasCronicas> value) {
    _$listDoencaCronicaAtom.reportWrite(value, super.listDoencaCronica, () {
      super.listDoencaCronica = value;
    });
  }

  final _$submitFormAsyncAction =
      AsyncAction('_DoencaCronicaControllerBase.submitForm');

  @override
  Future<void> submitForm(BuildContext context) {
    return _$submitFormAsyncAction.run(() => super.submitForm(context));
  }

  final _$getDoencasCronicasAsyncAction =
      AsyncAction('_DoencaCronicaControllerBase.getDoencasCronicas');

  @override
  Future getDoencasCronicas(BuildContext context) {
    return _$getDoencasCronicasAsyncAction
        .run(() => super.getDoencasCronicas(context));
  }

  final _$removeItemAsyncAction =
      AsyncAction('_DoencaCronicaControllerBase.removeItem');

  @override
  Future removeItem(dynamic item, BuildContext context) {
    return _$removeItemAsyncAction.run(() => super.removeItem(item, context));
  }

  final _$editItemAsyncAction =
      AsyncAction('_DoencaCronicaControllerBase.editItem');

  @override
  Future editItem(DoencasCronicas item) {
    return _$editItemAsyncAction.run(() => super.editItem(item));
  }

  final _$_DoencaCronicaControllerBaseActionController =
      ActionController(name: '_DoencaCronicaControllerBase');

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
status: ${status},
oldValueMedicamento: ${oldValueMedicamento},
listDoencaCronica: ${listDoencaCronica}
    ''';
  }
}
