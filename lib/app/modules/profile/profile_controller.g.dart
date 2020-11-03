// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $ProfileController = BindInject(
  (i) => ProfileController(i<ProfileRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$usersAtom = Atom(name: '_ProfileControllerBase.users');

  @override
  String get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(String value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$firstLetterAtom = Atom(name: '_ProfileControllerBase.firstLetter');

  @override
  String get firstLetter {
    _$firstLetterAtom.reportRead();
    return super.firstLetter;
  }

  @override
  set firstLetter(String value) {
    _$firstLetterAtom.reportWrite(value, super.firstLetter, () {
      super.firstLetter = value;
    });
  }

  final _$emailAtom = Atom(name: '_ProfileControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$perfilAtom = Atom(name: '_ProfileControllerBase.perfil');

  @override
  ObservableList<dynamic> get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(ObservableList<dynamic> value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$listProcedimentosAtom =
      Atom(name: '_ProfileControllerBase.listProcedimentos');

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

  final _$listDadosMedicosAtom =
      Atom(name: '_ProfileControllerBase.listDadosMedicos');

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

  final _$statusAtom = Atom(name: '_ProfileControllerBase.status');

  @override
  ProfileStatusRequest get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ProfileStatusRequest value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$jwtDecodeAsyncAction =
      AsyncAction('_ProfileControllerBase.jwtDecode');

  @override
  Future<dynamic> jwtDecode() {
    return _$jwtDecodeAsyncAction.run(() => super.jwtDecode());
  }

  final _$editUserAsyncAction = AsyncAction('_ProfileControllerBase.editUser');

  @override
  Future<dynamic> editUser(BuildContext context) {
    return _$editUserAsyncAction.run(() => super.editUser(context));
  }

  final _$getProcedimentosMedicosAsyncAction =
      AsyncAction('_ProfileControllerBase.getProcedimentosMedicos');

  @override
  Future<dynamic> getProcedimentosMedicos(BuildContext context) {
    return _$getProcedimentosMedicosAsyncAction
        .run(() => super.getProcedimentosMedicos(context));
  }

  final _$deleteProcedimentoMedicoAsyncAction =
      AsyncAction('_ProfileControllerBase.deleteProcedimentoMedico');

  @override
  Future deleteProcedimentoMedico(int id, BuildContext context) {
    return _$deleteProcedimentoMedicoAsyncAction
        .run(() => super.deleteProcedimentoMedico(id, context));
  }

  final _$getDadosMedicosAsyncAction =
      AsyncAction('_ProfileControllerBase.getDadosMedicos');

  @override
  Future<dynamic> getDadosMedicos(BuildContext context) {
    return _$getDadosMedicosAsyncAction
        .run(() => super.getDadosMedicos(context));
  }

  final _$_ProfileControllerBaseActionController =
      ActionController(name: '_ProfileControllerBase');

  @override
  dynamic clearInputDesMedicamento() {
    final _$actionInfo = _$_ProfileControllerBaseActionController.startAction(
        name: '_ProfileControllerBase.clearInputDesMedicamento');
    try {
      return super.clearInputDesMedicamento();
    } finally {
      _$_ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
users: ${users},
firstLetter: ${firstLetter},
email: ${email},
perfil: ${perfil},
listProcedimentos: ${listProcedimentos},
listDadosMedicos: ${listDadosMedicos},
status: ${status}
    ''';
  }
}
