// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicamento_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MedicamentoController = BindInject(
  (i) => MedicamentoController(i<IMedicamentoRepository>()),
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

  final _$statusAtom = Atom(name: '_MedicamentoControllerBase.status');

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
      Atom(name: '_MedicamentoControllerBase.oldValueMedicamento');

  @override
  Medicamentos get oldValueMedicamento {
    _$oldValueMedicamentoAtom.reportRead();
    return super.oldValueMedicamento;
  }

  @override
  set oldValueMedicamento(Medicamentos value) {
    _$oldValueMedicamentoAtom.reportWrite(value, super.oldValueMedicamento, () {
      super.oldValueMedicamento = value;
    });
  }

  final _$listMedicamentoAtom =
      Atom(name: '_MedicamentoControllerBase.listMedicamento');

  @override
  ObservableList<Medicamentos> get listMedicamento {
    _$listMedicamentoAtom.reportRead();
    return super.listMedicamento;
  }

  @override
  set listMedicamento(ObservableList<Medicamentos> value) {
    _$listMedicamentoAtom.reportWrite(value, super.listMedicamento, () {
      super.listMedicamento = value;
    });
  }

  final _$medicamentosAtom =
      Atom(name: '_MedicamentoControllerBase.medicamentos');

  @override
  dynamic get medicamentos {
    _$medicamentosAtom.reportRead();
    return super.medicamentos;
  }

  @override
  set medicamentos(dynamic value) {
    _$medicamentosAtom.reportWrite(value, super.medicamentos, () {
      super.medicamentos = value;
    });
  }

  final _$removeItemAsyncAction =
      AsyncAction('_MedicamentoControllerBase.removeItem');

  @override
  Future removeItem(dynamic item, BuildContext context) {
    return _$removeItemAsyncAction.run(() => super.removeItem(item, context));
  }

  final _$editItemAsyncAction =
      AsyncAction('_MedicamentoControllerBase.editItem');

  @override
  Future editItem(Medicamentos item) {
    return _$editItemAsyncAction.run(() => super.editItem(item));
  }

  final _$submitFormAsyncAction =
      AsyncAction('_MedicamentoControllerBase.submitForm');

  @override
  Future<void> submitForm(BuildContext context) {
    return _$submitFormAsyncAction.run(() => super.submitForm(context));
  }

  final _$_MedicamentoControllerBaseActionController =
      ActionController(name: '_MedicamentoControllerBase');

  @override
  dynamic setOldValueMedicamento() {
    final _$actionInfo = _$_MedicamentoControllerBaseActionController
        .startAction(name: '_MedicamentoControllerBase.setOldValueMedicamento');
    try {
      return super.setOldValueMedicamento();
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
status: ${status},
oldValueMedicamento: ${oldValueMedicamento},
listMedicamento: ${listMedicamento},
medicamentos: ${medicamentos}
    ''';
  }
}
