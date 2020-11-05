// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dados_medicos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DadosMedicosController = BindInject(
  (i) => DadosMedicosController(i<IDadosMedicosRepository>(),
      i<IQrCodeRepository>(), i<IProfileRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DadosMedicosController on _DadosMedicosControllerBase, Store {
  final _$tipoSanguineoAtom =
      Atom(name: '_DadosMedicosControllerBase.tipoSanguineo');

  @override
  dynamic get tipoSanguineo {
    _$tipoSanguineoAtom.reportRead();
    return super.tipoSanguineo;
  }

  @override
  set tipoSanguineo(dynamic value) {
    _$tipoSanguineoAtom.reportWrite(value, super.tipoSanguineo, () {
      super.tipoSanguineo = value;
    });
  }

  final _$tituloAtom = Atom(name: '_DadosMedicosControllerBase.titulo');

  @override
  TextEditingController get titulo {
    _$tituloAtom.reportRead();
    return super.titulo;
  }

  @override
  set titulo(TextEditingController value) {
    _$tituloAtom.reportWrite(value, super.titulo, () {
      super.titulo = value;
    });
  }

  final _$descLocalAtom = Atom(name: '_DadosMedicosControllerBase.descLocal');

  @override
  TextEditingController get descLocal {
    _$descLocalAtom.reportRead();
    return super.descLocal;
  }

  @override
  set descLocal(TextEditingController value) {
    _$descLocalAtom.reportWrite(value, super.descLocal, () {
      super.descLocal = value;
    });
  }

  final _$dtRetornoAtom = Atom(name: '_DadosMedicosControllerBase.dtRetorno');

  @override
  TextEditingController get dtRetorno {
    _$dtRetornoAtom.reportRead();
    return super.dtRetorno;
  }

  @override
  set dtRetorno(TextEditingController value) {
    _$dtRetornoAtom.reportWrite(value, super.dtRetorno, () {
      super.dtRetorno = value;
    });
  }

  final _$dtProcedimentoAtom =
      Atom(name: '_DadosMedicosControllerBase.dtProcedimento');

  @override
  TextEditingController get dtProcedimento {
    _$dtProcedimentoAtom.reportRead();
    return super.dtProcedimento;
  }

  @override
  set dtProcedimento(TextEditingController value) {
    _$dtProcedimentoAtom.reportWrite(value, super.dtProcedimento, () {
      super.dtProcedimento = value;
    });
  }

  final _$idTipoProcedimentoAtom =
      Atom(name: '_DadosMedicosControllerBase.idTipoProcedimento');

  @override
  int get idTipoProcedimento {
    _$idTipoProcedimentoAtom.reportRead();
    return super.idTipoProcedimento;
  }

  @override
  set idTipoProcedimento(int value) {
    _$idTipoProcedimentoAtom.reportWrite(value, super.idTipoProcedimento, () {
      super.idTipoProcedimento = value;
    });
  }

  final _$descMedicamentoAtom =
      Atom(name: '_DadosMedicosControllerBase.descMedicamento');

  @override
  TextEditingController get descMedicamento {
    _$descMedicamentoAtom.reportRead();
    return super.descMedicamento;
  }

  @override
  set descMedicamento(TextEditingController value) {
    _$descMedicamentoAtom.reportWrite(value, super.descMedicamento, () {
      super.descMedicamento = value;
    });
  }

  final _$descDoencaAtom = Atom(name: '_DadosMedicosControllerBase.descDoenca');

  @override
  TextEditingController get descDoenca {
    _$descDoencaAtom.reportRead();
    return super.descDoenca;
  }

  @override
  set descDoenca(TextEditingController value) {
    _$descDoencaAtom.reportWrite(value, super.descDoenca, () {
      super.descDoenca = value;
    });
  }

  final _$descAlergiaAtom =
      Atom(name: '_DadosMedicosControllerBase.descAlergia');

  @override
  TextEditingController get descAlergia {
    _$descAlergiaAtom.reportRead();
    return super.descAlergia;
  }

  @override
  set descAlergia(TextEditingController value) {
    _$descAlergiaAtom.reportWrite(value, super.descAlergia, () {
      super.descAlergia = value;
    });
  }

  final _$tipoAlergiaAtom =
      Atom(name: '_DadosMedicosControllerBase.tipoAlergia');

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

  final _$listTipoSanguineoAtom =
      Atom(name: '_DadosMedicosControllerBase.listTipoSanguineo');

  @override
  ObservableList<dynamic> get listTipoSanguineo {
    _$listTipoSanguineoAtom.reportRead();
    return super.listTipoSanguineo;
  }

  @override
  set listTipoSanguineo(ObservableList<dynamic> value) {
    _$listTipoSanguineoAtom.reportWrite(value, super.listTipoSanguineo, () {
      super.listTipoSanguineo = value;
    });
  }

  final _$listTipoProcedimentosAtom =
      Atom(name: '_DadosMedicosControllerBase.listTipoProcedimentos');

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

  final _$listDadosMedicosAtom =
      Atom(name: '_DadosMedicosControllerBase.listDadosMedicos');

  @override
  ObservableList<dynamic> get listDadosMedicos {
    _$listDadosMedicosAtom.reportRead();
    return super.listDadosMedicos;
  }

  @override
  set listDadosMedicos(ObservableList<dynamic> value) {
    _$listDadosMedicosAtom.reportWrite(value, super.listDadosMedicos, () {
      super.listDadosMedicos = value;
    });
  }

  final _$listProcedimentosMedicosAtom =
      Atom(name: '_DadosMedicosControllerBase.listProcedimentosMedicos');

  @override
  ObservableList<dynamic> get listProcedimentosMedicos {
    _$listProcedimentosMedicosAtom.reportRead();
    return super.listProcedimentosMedicos;
  }

  @override
  set listProcedimentosMedicos(ObservableList<dynamic> value) {
    _$listProcedimentosMedicosAtom
        .reportWrite(value, super.listProcedimentosMedicos, () {
      super.listProcedimentosMedicos = value;
    });
  }

  final _$listTiposAlergiaAtom =
      Atom(name: '_DadosMedicosControllerBase.listTiposAlergia');

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

  final _$statusAtom = Atom(name: '_DadosMedicosControllerBase.status');

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

  final _$paramsRouteAtom =
      Atom(name: '_DadosMedicosControllerBase.paramsRoute');

  @override
  dynamic get paramsRoute {
    _$paramsRouteAtom.reportRead();
    return super.paramsRoute;
  }

  @override
  set paramsRoute(dynamic value) {
    _$paramsRouteAtom.reportWrite(value, super.paramsRoute, () {
      super.paramsRoute = value;
    });
  }

  final _$isMedicoAtom = Atom(name: '_DadosMedicosControllerBase.isMedico');

  @override
  bool get isMedico {
    _$isMedicoAtom.reportRead();
    return super.isMedico;
  }

  @override
  set isMedico(bool value) {
    _$isMedicoAtom.reportWrite(value, super.isMedico, () {
      super.isMedico = value;
    });
  }

  final _$editDadosMedicosAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.editDadosMedicos');

  @override
  Future<dynamic> editDadosMedicos(BuildContext context) {
    return _$editDadosMedicosAsyncAction
        .run(() => super.editDadosMedicos(context));
  }

  final _$getTipoSanguineoAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getTipoSanguineo');

  @override
  Future<dynamic> getTipoSanguineo(BuildContext context) {
    return _$getTipoSanguineoAsyncAction
        .run(() => super.getTipoSanguineo(context));
  }

  final _$getDadosMedicosAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getDadosMedicos');

  @override
  Future<dynamic> getDadosMedicos(BuildContext context) {
    return _$getDadosMedicosAsyncAction
        .run(() => super.getDadosMedicos(context));
  }

  final _$editMedicamentoAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.editMedicamento');

  @override
  Future<dynamic> editMedicamento(BuildContext context) {
    return _$editMedicamentoAsyncAction
        .run(() => super.editMedicamento(context));
  }

  final _$editDoencaCronicaAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.editDoencaCronica');

  @override
  Future<dynamic> editDoencaCronica(BuildContext context) {
    return _$editDoencaCronicaAsyncAction
        .run(() => super.editDoencaCronica(context));
  }

  final _$editAlergiaAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.editAlergia');

  @override
  Future<dynamic> editAlergia(BuildContext context) {
    return _$editAlergiaAsyncAction.run(() => super.editAlergia(context));
  }

  final _$getTiposAlergiaAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getTiposAlergia');

  @override
  Future<dynamic> getTiposAlergia(BuildContext context) {
    return _$getTiposAlergiaAsyncAction
        .run(() => super.getTiposAlergia(context));
  }

  final _$getDadosMedicosTokenAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getDadosMedicosToken');

  @override
  Future<dynamic> getDadosMedicosToken(BuildContext context, dynamic data) {
    return _$getDadosMedicosTokenAsyncAction
        .run(() => super.getDadosMedicosToken(context, data));
  }

  final _$getProcedimentosMedicosTokenAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getProcedimentosMedicosToken');

  @override
  Future<dynamic> getProcedimentosMedicosToken(
      BuildContext context, dynamic data) {
    return _$getProcedimentosMedicosTokenAsyncAction
        .run(() => super.getProcedimentosMedicosToken(context, data));
  }

  final _$getProcedimentosMedicosAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getProcedimentosMedicos');

  @override
  Future<dynamic> getProcedimentosMedicos(BuildContext context) {
    return _$getProcedimentosMedicosAsyncAction
        .run(() => super.getProcedimentosMedicos(context));
  }

  final _$cadastroAlergiaAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.cadastroAlergia');

  @override
  Future<dynamic> cadastroAlergia(BuildContext context) {
    return _$cadastroAlergiaAsyncAction
        .run(() => super.cadastroAlergia(context));
  }

  final _$cadastroDoencaCronicaAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.cadastroDoencaCronica');

  @override
  Future<dynamic> cadastroDoencaCronica(BuildContext context) {
    return _$cadastroDoencaCronicaAsyncAction
        .run(() => super.cadastroDoencaCronica(context));
  }

  final _$cadastroMedicamentoAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.cadastroMedicamento');

  @override
  Future<dynamic> cadastroMedicamento(BuildContext context) {
    return _$cadastroMedicamentoAsyncAction
        .run(() => super.cadastroMedicamento(context));
  }

  final _$cadastroProcedimentoMedicoAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.cadastroProcedimentoMedico');

  @override
  Future<dynamic> cadastroProcedimentoMedico(BuildContext context) {
    return _$cadastroProcedimentoMedicoAsyncAction
        .run(() => super.cadastroProcedimentoMedico(context));
  }

  final _$getTipoProcedimentosAsyncAction =
      AsyncAction('_DadosMedicosControllerBase.getTipoProcedimentos');

  @override
  Future<dynamic> getTipoProcedimentos(BuildContext context) {
    return _$getTipoProcedimentosAsyncAction
        .run(() => super.getTipoProcedimentos(context));
  }

  final _$_DadosMedicosControllerBaseActionController =
      ActionController(name: '_DadosMedicosControllerBase');

  @override
  dynamic getParamsRota(BuildContext context) {
    final _$actionInfo = _$_DadosMedicosControllerBaseActionController
        .startAction(name: '_DadosMedicosControllerBase.getParamsRota');
    try {
      return super.getParamsRota(context);
    } finally {
      _$_DadosMedicosControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tipoSanguineo: ${tipoSanguineo},
titulo: ${titulo},
descLocal: ${descLocal},
dtRetorno: ${dtRetorno},
dtProcedimento: ${dtProcedimento},
idTipoProcedimento: ${idTipoProcedimento},
descMedicamento: ${descMedicamento},
descDoenca: ${descDoenca},
descAlergia: ${descAlergia},
tipoAlergia: ${tipoAlergia},
listTipoSanguineo: ${listTipoSanguineo},
listTipoProcedimentos: ${listTipoProcedimentos},
listDadosMedicos: ${listDadosMedicos},
listProcedimentosMedicos: ${listProcedimentosMedicos},
listTiposAlergia: ${listTiposAlergia},
status: ${status},
paramsRoute: ${paramsRoute},
isMedico: ${isMedico}
    ''';
  }
}
