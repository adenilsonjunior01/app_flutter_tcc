import 'dart:convert';

import 'package:app_tcc/app/modules/profile/repositories/interfaces/profile_repository_interface.dart';
import 'package:app_tcc/app/modules/qr_code/repositories/interfaces/qr_code_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/interfaces/dados_medicos_repository_interface.dart';
import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/shared/models/dados_medicos_model.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'dados_medicos_controller.g.dart';

@Injectable()
class DadosMedicosController = _DadosMedicosControllerBase
    with _$DadosMedicosController;

abstract class _DadosMedicosControllerBase with Store {
  IDadosMedicosRepository repository;
  IQrCodeRepository respositoryQrCode;
  IProfileRepository repositoryProfile;
  _DadosMedicosControllerBase(
      this.repository, this.respositoryQrCode, this.repositoryProfile);

  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  TextEditingController newDescMedicamento = TextEditingController();

  GlobalKey<FormBuilderState> formBuildKey = GlobalKey<FormBuilderState>();

  TextEditingController altura = TextEditingController();
  TextEditingController peso = TextEditingController();
  @observable
  var tipoSanguineo;

  @observable
  TextEditingController titulo = TextEditingController();
  @observable
  TextEditingController descLocal = TextEditingController();
  @observable
  TextEditingController dtRetorno = TextEditingController();
  @observable
  TextEditingController dtProcedimento = TextEditingController();
  @observable
  int idTipoProcedimento;

  TextEditingController descricao = TextEditingController();

  @observable
  TextEditingController descMedicamento = TextEditingController();

  @observable
  TextEditingController descDoenca = TextEditingController();

  @observable
  TextEditingController descAlergia = TextEditingController();

  @observable
  var tipoAlergia;
  TextEditingController descAlergias = TextEditingController();

  @observable
  var listTipoSanguineo = ObservableList();

  @observable
  var listTipoProcedimentos = ObservableList();

  @observable
  var listDadosMedicos = ObservableList();

  @observable
  var listProcedimentosMedicos = ObservableList();

  @observable
  var listTiposAlergia = ObservableList();

  @observable
  RegistroStatusRequest status = RegistroStatusRequest.none;

  @observable
  var paramsRoute;

  @observable
  bool isMedico = false;

  @action
  Future editDadosMedicos(BuildContext context) async {
    Map<String, dynamic> params = {
      'altura': altura.text,
      'peso': peso.text,
      'tipoSanguineo': tipoSanguineo.id,
    };

    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.editDadosMedicos(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Dados Médicos alterado com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Dados Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getTipoSanguineo(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var tipos = await repository.getTipoSanguineo;
      listTipoSanguineo.clear();
      tipos.forEach((value) => listTipoSanguineo.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getDadosMedicos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var tipos = await repository.getDadosMedicos;
      listDadosMedicos.clear();
      // tipos.forEach((value) => listDadosMedicos.add(value));
      listDadosMedicos.add(tipos);
      status = RegistroStatusRequest.success;
      getProcedimentosMedicos(context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  // edição feita pelo médico
  @action
  Future editMedicamento(BuildContext context) async {
    Map<String, dynamic> params = {
      'altura': altura.text,
      'peso': peso.text,
      'tipoSanguineo': tipoSanguineo.id,
    };

    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.editDadosMedicos(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Medicamento alterada com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Medicamento!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  // edição feita pelo médico
  @action
  Future editDoencaCronica(BuildContext context) async {
    Map<String, dynamic> params = {
      'altura': altura.text,
      'peso': peso.text,
      'tipoSanguineo': tipoSanguineo.id,
    };

    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.editDadosMedicos(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Doença Crônica alterada com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Doença Crônica!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  // edição feita pelo médico
  @action
  Future editAlergia(BuildContext context) async {
    Map<String, dynamic> params = {
      'altura': altura.text,
      'peso': peso.text,
      'tipoSanguineo': tipoSanguineo.id,
    };

    var body = json.encode(params);
    status = RegistroStatusRequest.loading;

    try {
      var procedimento = await repository.editDadosMedicos(body);
      status = RegistroStatusRequest.success;
      showFlushBar(
          message: 'Alergia alterada com sucesso!',
          title: 'Sucesso',
          type: 'success',
          context: context);
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao editar Alergia!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getTiposAlergia(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    getParamsRota(context);
    try {
      var tipos = await repository.getTipoAlergias;
      listTiposAlergia.clear();
      tipos.forEach((value) => listTiposAlergia.add(value));
      // status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar tipos de Alergias!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  // Verifica parametros vindo pelo rota e se contem Token.
  @action
  getParamsRota(BuildContext context) {
    paramsRoute = Modular.args.data;
    if (paramsRoute != null) {
      // IMPLEMENTAR LÓGICA REGRAS COM BASE NOS END-POINT DE QRCODE
      isMedico = true;
      getDadosMedicosToken(context, paramsRoute);
    } else {
      isMedico = false;
      getDadosMedicos(context);
    }
  }

  @action
  Future getDadosMedicosToken(BuildContext context, dynamic data) async {
    try {
      Map<String, dynamic> params = {
        'token': data,
      };
      var body = json.encode(params);

      var dados = await respositoryQrCode.getDadosMedicosQrCode(body);
      getProcedimentosMedicosToken(context, paramsRoute);

      listDadosMedicos.clear();
      // dados.forEach((value) => listDadosMedicos.add(value));
      listDadosMedicos.add(dados);
      status = RegistroStatusRequest.success;
    } catch (e) {
      getProcedimentosMedicosToken(context, paramsRoute);
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Dados Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getProcedimentosMedicosToken(
      BuildContext context, dynamic data) async {
    try {
      Map<String, dynamic> params = {
        'token': data,
      };
      var body = json.encode(params);

      var tipos = await respositoryQrCode.getProcedimentosMedicosQrCode(body);
      listProcedimentosMedicos.clear();
      tipos.forEach((value) => listProcedimentosMedicos.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Procedimentos Médicos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

  @action
  Future getProcedimentosMedicos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var procedimentos = await repositoryProfile.getProcedimentosMedicos;
      listProcedimentosMedicos.clear();
      procedimentos.forEach((value) => listProcedimentosMedicos.add(value));
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error;
      showFlushBar(
          message: 'Nenhum registro de Procedimentos Médicos encontrado!',
          title: 'Oops!',
          type: 'warning',
          context: context);
    }
  }

  // CADASTROS FEITO POR PROFISSIONAL DA SAÚDE
  @action
  Future cadastroAlergia(BuildContext context) async {
    if (formBuildKey.currentState.saveAndValidate()) {
      try {
        status = RegistroStatusRequest.loading;
        Map<String, dynamic> params = {
          "descAlergia": descAlergia.text,
          "idTipoAlergia": tipoAlergia,
          "code": paramsRoute
        };
        var body = json.encode(params);
        var alergia = await respositoryQrCode.cadastroAlergia(body);
        listDadosMedicos.forEach((element) {
          element.alergias.add(alergia);
        });
        showFlushBar(
            message: 'Alergia cadastrada com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
        status = RegistroStatusRequest.success;
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao cadastrar Alergia!',
            title: 'Oops!',
            type: 'error',
            context: context);
      }
    } else {
      showFlushBar(
          message: 'Preencha os campos corretamente!',
          title: 'Oops!',
          type: 'warning',
          context: context);
    }
  }

  @action
  Future cadastroDoencaCronica(BuildContext context) async {
    if (formBuildKey.currentState.saveAndValidate()) {
      status = RegistroStatusRequest.loading;
      try {
        Map<String, dynamic> params = {
          "descDoenca": descDoenca.text,
          "code": paramsRoute
        };
        var body = json.encode(params);
        var doencaCronica = await respositoryQrCode.cadastroDoencaCronica(body);

        listDadosMedicos.forEach((element) {
          element.doencasCronicas.add(doencaCronica);
        });
        showFlushBar(
            message: 'Doença Crônica cadastrada com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
        status = RegistroStatusRequest.success;
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao buscar Doença Crônica!',
            title: 'Oops!',
            type: 'error',
            context: context);
      }
    } else {
      return null;
    }
  }

  @action
  Future cadastroMedicamento(BuildContext context) async {
    if (formBuildKey.currentState.saveAndValidate()) {
      status = RegistroStatusRequest.loading;
      try {
        Map<String, dynamic> params = {
          "desc": descMedicamento.text,
          "code": paramsRoute
        };
        var body = json.encode(params);

        var medicamento = await respositoryQrCode.cadastroMedicamento(body);
        status = RegistroStatusRequest.success;
        listDadosMedicos.forEach((element) {
          element.medicamentos.add(medicamento);
        });
        showFlushBar(
            message: 'Medicamento cadastrado com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
        status = RegistroStatusRequest.success;
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao buscar Medicamento!',
            title: 'Oops!',
            type: 'error',
            context: context);
      }
    } else {
      return null;
    }
  }

  @action
  Future cadastroProcedimentoMedico(BuildContext context) async {
    if (formBuildKey.currentState.saveAndValidate()) {
      try {
        status = RegistroStatusRequest.loading;
        Map<String, dynamic> params = {
          "titulo": titulo.text,
          "code": paramsRoute,
          "descLocal": descLocal.text,
          "dtRetorno": dtRetorno.text,
          "dtProcedimento": dtProcedimento.text,
          "descricao": descricao.text,
          "idTipoProcedimento": idTipoProcedimento
        };

        var body = json.encode(params);

        var procedimento =
            await respositoryQrCode.cadastroProcedimentoMedico(body);
        listProcedimentosMedicos.forEach((element) {
          element.add(procedimento);
        });
        status = RegistroStatusRequest.success;
        showFlushBar(
            message: 'Procedimento Médico cadastrado com sucesso!',
            title: 'Sucesso',
            type: 'success',
            context: context);
        status = RegistroStatusRequest.success;
      } catch (e) {
        status = RegistroStatusRequest.error..value = e;
        showFlushBar(
            message: 'Erro ao buscar Procedimento Médico !',
            title: 'Oops!',
            type: 'error',
            context: context);
      }
    } else {
      return null;
    }
  }

  @action
  Future getTipoProcedimentos(BuildContext context) async {
    status = RegistroStatusRequest.loading;
    try {
      var listaTipos = await repository.getTipoProcedimentoMedico;
      listTipoProcedimentos.clear();
      listaTipos.forEach((value) => listTipoProcedimentos.add(value));
      getParamsRota(context);
      status = RegistroStatusRequest.success;
    } catch (e) {
      status = RegistroStatusRequest.error..value = e;
      showFlushBar(
          message: 'Erro ao buscar Tipos de Procedimentos!',
          title: 'Oops!',
          type: 'error',
          context: context);
    }
  }

// -----------------
  showFlushBar(
      {String message, String type, String title, BuildContext context}) {
    switch (type) {
      case 'success':
        {
          FlushbarHelper.createSuccess(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'error':
        {
          FlushbarHelper.createError(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'warning':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      case 'info':
        {
          FlushbarHelper.createInformation(
              message: message, title: title, duration: Duration(seconds: 4))
            ..show(context);
          break;
        }
      default:
        {
          Flushbar(
            title: title,
            message: message,
            duration: Duration(seconds: 4),
          )..show(context);
          break;
        }
    }
  }
}
