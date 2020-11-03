import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'cadastro_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CadastroUserPage extends StatefulWidget {
  final String title;
  const CadastroUserPage({Key key, this.title = "Criar conta"})
      : super(key: key);

  @override
  _CadastroUserPageState createState() => _CadastroUserPageState();
}

class _CadastroUserPageState
    extends ModularState<CadastroUserPage, CadastroUserController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    @override
    initState() {
      controller.status = LoginStatus.none;
    }

    final formatPhone = DateFormat("00 0 0000-0000");
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (_) {
          if (controller.status == LoginStatus.loading) {
            return LoadingLottie();
          } else if (controller.status == LoginStatus.none) {
            return Container(
              height: _altura,
              width: _largura,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/login/bg_cadastro_user.png'),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: controller.formBuilderKey,
                  child: Column(
                    children: [_title(context), _body(context)],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              height: _altura,
              width: _largura,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/images/login/bg_cadastro_user.png'),
                    fit: BoxFit.fill),
              ),
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: controller.formBuilderKey,
                  child: Column(
                    children: [_title(context), _body(context)],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  _title(BuildContext context) {
    return Container(
        child: SafeArea(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: OutlineButton(
              onPressed: () {
                controller.backPage(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              borderSide: BorderSide(color: Colors.white),
              shape: CircleBorder(),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, top: 90),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Crie sua conta",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }

  _body(BuildContext context) {
    final format = DateFormat("dd-MM-yyyy");
    var maskFormatter = new MaskTextInputFormatter(
        mask: '## # #### ####', filter: {"#": RegExp(r'[0-9]')});
    return Column(
      children: [
        Observer(
          builder: (context) {
            if (controller.status == LoginStatus.error) {
              return Container(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      Text(
                          controller.messageRequest != null
                              ? controller.messageRequest
                              : '',
                          style: (TextStyle(color: Colors.red, fontSize: 13))),
                      ListView.builder(
                          padding: EdgeInsets.all(0),
                          shrinkWrap: true,
                          itemCount: controller.messagesRequestErrors.length,
                          itemBuilder: (_, index) => ListTile(
                                title: Text(
                                  controller.messagesRequestErrors[index] !=
                                          null
                                      ? controller.messagesRequestErrors[index]
                                          .nomeCampo
                                      : controller.messageRequest,
                                  style: (TextStyle(
                                      color: Colors.red, fontSize: 13)),
                                ),
                                subtitle: Text(
                                  controller.messagesRequestErrors[index] !=
                                          null
                                      ? controller
                                          .messagesRequestErrors[index].mensagem
                                      : '',
                                  style: (TextStyle(
                                      color: Colors.red, fontSize: 13)),
                                ),
                              ))
                    ],
                  ));
            } else {
              return Container();
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderTextField(
              attribute: 'Nome Completo',
              controller: controller.nome,
              style: TextStyle(color: Colors.white),
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(

                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Nome completo",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderTextField(
              attribute: 'E-mail',
              style: TextStyle(color: Colors.white),
              controller: controller.email,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório'),
                FormBuilderValidators.email(errorText: 'E-mail inválido')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "E-mail",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderDateTimePicker(
              attribute: 'Data de nascimento',
              inputType: InputType.date,
              style: TextStyle(color: Colors.white),
              controller: controller.dtNascimento,
              format: format,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Data de nascimento",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderTextField(
              attribute: 'Telefone',
              inputFormatters: [maskFormatter],
              controller: controller.telefone,
              style: TextStyle(color: Colors.white),
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Telefone",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderDropdown(
              attribute: 'Sexo',
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              onChanged: (newValue) {
                setState(() {
                  controller.sexo = newValue;
                });
              },
              items: ['Masculino', 'Feminino', 'Prefiro não optar']
                  .map((sexo) => DropdownMenuItem(
                      value: sexo,
                      child: Text(
                        "$sexo",
                      )))
                  .toList(),
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Sexo",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderTextField(
              attribute: 'Senha',
              controller: controller.senha,
              style: TextStyle(color: Colors.white),
              obscureText: true,
              validators: [
                FormBuilderValidators.required(errorText: 'Campo obrigatório')
              ],
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(13),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white10)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  hintText: "Senha",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderCheckbox(
              contentPadding: EdgeInsets.all(0),
              attribute: 'Você é um(a) Profissional da saúde?',
              onChanged: (value) {
                controller.medico = value;
              },
              label: Text(
                "Você é um(a) Profissional da saúde?",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              decoration: InputDecoration(
                  // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  contentPadding: EdgeInsets.all(0),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintText: "Profissional de saúde?",
                  hintStyle: TextStyle(color: Colors.white))),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
            child: Column(
              children: [
                FlatButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white)),
                  onPressed: () {
                    controller.submitForm(context);
                  },
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter Medium',
                        fontSize: 18),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
