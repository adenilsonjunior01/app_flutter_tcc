// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(repository: i<HomeRepository>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$valueAtom = Atom(name: '_HomeControllerBase.value');

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

  final _$usersAtom = Atom(name: '_HomeControllerBase.users');

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

  final _$perfilAtom = Atom(name: '_HomeControllerBase.perfil');

  @override
  String get perfil {
    _$perfilAtom.reportRead();
    return super.perfil;
  }

  @override
  set perfil(String value) {
    _$perfilAtom.reportWrite(value, super.perfil, () {
      super.perfil = value;
    });
  }

  final _$listProcedimentosGeralAtom =
      Atom(name: '_HomeControllerBase.listProcedimentosGeral');

  @override
  ObservableList<dynamic> get listProcedimentosGeral {
    _$listProcedimentosGeralAtom.reportRead();
    return super.listProcedimentosGeral;
  }

  @override
  set listProcedimentosGeral(ObservableList<dynamic> value) {
    _$listProcedimentosGeralAtom
        .reportWrite(value, super.listProcedimentosGeral, () {
      super.listProcedimentosGeral = value;
    });
  }

  final _$statusAtom = Atom(name: '_HomeControllerBase.status');

  @override
  HomeStatusRequest get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(HomeStatusRequest value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$firstLetterAtom = Atom(name: '_HomeControllerBase.firstLetter');

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

  final _$dataMapAtom = Atom(name: '_HomeControllerBase.dataMap');

  @override
  Map<String, double> get dataMap {
    _$dataMapAtom.reportRead();
    return super.dataMap;
  }

  @override
  set dataMap(Map<String, double> value) {
    _$dataMapAtom.reportWrite(value, super.dataMap, () {
      super.dataMap = value;
    });
  }

  final _$jwtDecodeAsyncAction = AsyncAction('_HomeControllerBase.jwtDecode');

  @override
  Future<dynamic> jwtDecode() {
    return _$jwtDecodeAsyncAction.run(() => super.jwtDecode());
  }

  final _$logoutAsyncAction = AsyncAction('_HomeControllerBase.logout');

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$getProcedimentosGeralAsyncAction =
      AsyncAction('_HomeControllerBase.getProcedimentosGeral');

  @override
  Future<dynamic> getProcedimentosGeral(BuildContext context) {
    return _$getProcedimentosGeralAsyncAction
        .run(() => super.getProcedimentosGeral(context));
  }

  @override
  String toString() {
    return '''
value: ${value},
users: ${users},
perfil: ${perfil},
listProcedimentosGeral: ${listProcedimentosGeral},
status: ${status},
firstLetter: ${firstLetter},
dataMap: ${dataMap}
    ''';
  }
}
