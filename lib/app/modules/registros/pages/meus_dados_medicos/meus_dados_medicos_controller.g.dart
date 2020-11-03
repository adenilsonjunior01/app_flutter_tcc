// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meus_dados_medicos_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $MeusDadosMedicosController = BindInject(
  (i) => MeusDadosMedicosController(i<MeusDadosMedicosRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MeusDadosMedicosController on _MeusDadosMedicosControllerBase, Store {
  final _$tipoSanguineoAtom =
      Atom(name: '_MeusDadosMedicosControllerBase.tipoSanguineo');

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

  final _$statusAtom = Atom(name: '_MeusDadosMedicosControllerBase.status');

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

  final _$listSanguineoAtom =
      Atom(name: '_MeusDadosMedicosControllerBase.listSanguineo');

  @override
  ObservableList<dynamic> get listSanguineo {
    _$listSanguineoAtom.reportRead();
    return super.listSanguineo;
  }

  @override
  set listSanguineo(ObservableList<dynamic> value) {
    _$listSanguineoAtom.reportWrite(value, super.listSanguineo, () {
      super.listSanguineo = value;
    });
  }

  final _$editDadosMedicosAsyncAction =
      AsyncAction('_MeusDadosMedicosControllerBase.editDadosMedicos');

  @override
  Future<dynamic> editDadosMedicos(BuildContext context) {
    return _$editDadosMedicosAsyncAction
        .run(() => super.editDadosMedicos(context));
  }

  final _$getTiposAlergiaAsyncAction =
      AsyncAction('_MeusDadosMedicosControllerBase.getTiposAlergia');

  @override
  Future getTiposAlergia(BuildContext context) {
    return _$getTiposAlergiaAsyncAction
        .run(() => super.getTiposAlergia(context));
  }

  @override
  String toString() {
    return '''
tipoSanguineo: ${tipoSanguineo},
status: ${status},
listSanguineo: ${listSanguineo}
    ''';
  }
}
