// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'procedimento_medico_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProcedimentoMedicoController = BindInject(
  (i) => ProcedimentoMedicoController(i<IProcedimentoMedicoRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProcedimentoMedicoController
    on _ProcedimentoMedicoControllerBase, Store {
  final _$idTipoProcedimentoAtom =
      Atom(name: '_ProcedimentoMedicoControllerBase.idTipoProcedimento');

  @override
  dynamic get idTipoProcedimento {
    _$idTipoProcedimentoAtom.reportRead();
    return super.idTipoProcedimento;
  }

  @override
  set idTipoProcedimento(dynamic value) {
    _$idTipoProcedimentoAtom.reportWrite(value, super.idTipoProcedimento, () {
      super.idTipoProcedimento = value;
    });
  }

  final _$statusAtom = Atom(name: '_ProcedimentoMedicoControllerBase.status');

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

  final _$listProcedimentosAtom =
      Atom(name: '_ProcedimentoMedicoControllerBase.listProcedimentos');

  @override
  ObservableList<dynamic> get listProcedimentos {
    _$listProcedimentosAtom.reportRead();
    return super.listProcedimentos;
  }

  @override
  set listProcedimentos(ObservableList<dynamic> value) {
    _$listProcedimentosAtom.reportWrite(value, super.listProcedimentos, () {
      super.listProcedimentos = value;
    });
  }

  final _$listTipoProcedimentosAtom =
      Atom(name: '_ProcedimentoMedicoControllerBase.listTipoProcedimentos');

  @override
  ObservableList<dynamic> get listTipoProcedimentos {
    _$listTipoProcedimentosAtom.reportRead();
    return super.listTipoProcedimentos;
  }

  @override
  set listTipoProcedimentos(ObservableList<dynamic> value) {
    _$listTipoProcedimentosAtom.reportWrite(value, super.listTipoProcedimentos,
        () {
      super.listTipoProcedimentos = value;
    });
  }

  final _$paramsRouteAtom =
      Atom(name: '_ProcedimentoMedicoControllerBase.paramsRoute');

  @override
  GetProcedimentoMedicoModel get paramsRoute {
    _$paramsRouteAtom.reportRead();
    return super.paramsRoute;
  }

  @override
  set paramsRoute(GetProcedimentoMedicoModel value) {
    _$paramsRouteAtom.reportWrite(value, super.paramsRoute, () {
      super.paramsRoute = value;
    });
  }

  final _$submitFormAsyncAction =
      AsyncAction('_ProcedimentoMedicoControllerBase.submitForm');

  @override
  Future<void> submitForm(BuildContext context) {
    return _$submitFormAsyncAction.run(() => super.submitForm(context));
  }

  final _$saveProcedimentoAsyncAction =
      AsyncAction('_ProcedimentoMedicoControllerBase.saveProcedimento');

  @override
  Future<void> saveProcedimento(BuildContext context) {
    return _$saveProcedimentoAsyncAction
        .run(() => super.saveProcedimento(context));
  }

  final _$editProcedimentoAsyncAction =
      AsyncAction('_ProcedimentoMedicoControllerBase.editProcedimento');

  @override
  Future<void> editProcedimento(BuildContext context) {
    return _$editProcedimentoAsyncAction
        .run(() => super.editProcedimento(context));
  }

  final _$getProcedimentosAsyncAction =
      AsyncAction('_ProcedimentoMedicoControllerBase.getProcedimentos');

  @override
  Future<dynamic> getProcedimentos(BuildContext context) {
    return _$getProcedimentosAsyncAction
        .run(() => super.getProcedimentos(context));
  }

  final _$getTipoProcedimentosAsyncAction =
      AsyncAction('_ProcedimentoMedicoControllerBase.getTipoProcedimentos');

  @override
  Future<dynamic> getTipoProcedimentos(BuildContext context) {
    return _$getTipoProcedimentosAsyncAction
        .run(() => super.getTipoProcedimentos(context));
  }

  final _$_ProcedimentoMedicoControllerBaseActionController =
      ActionController(name: '_ProcedimentoMedicoControllerBase');

  @override
  dynamic getParamsRota(BuildContext context) {
    final _$actionInfo = _$_ProcedimentoMedicoControllerBaseActionController
        .startAction(name: '_ProcedimentoMedicoControllerBase.getParamsRota');
    try {
      return super.getParamsRota(context);
    } finally {
      _$_ProcedimentoMedicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetStatus() {
    final _$actionInfo = _$_ProcedimentoMedicoControllerBaseActionController
        .startAction(name: '_ProcedimentoMedicoControllerBase.resetStatus');
    try {
      return super.resetStatus();
    } finally {
      _$_ProcedimentoMedicoControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idTipoProcedimento: ${idTipoProcedimento},
status: ${status},
listProcedimentos: ${listProcedimentos},
listTipoProcedimentos: ${listTipoProcedimentos},
paramsRoute: ${paramsRoute}
    ''';
  }
}
