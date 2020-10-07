import 'package:app_tcc/app/modules/login/login_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            return Container(
              alignment: Alignment.center,
              child: Center(child: CircularProgressIndicator()),
            );
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
                padding:
                    EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 90),
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

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
          child: FormBuilderTextField(
              attribute: 'Nome Completo',
              controller: controller.nome,
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
              controller: controller.telefone,
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
              validators: [FormBuilderValidators.required()],
              onChanged: (newValue) {
                setState(() {
                  controller.sexo = newValue;
                });
              },
              items: ['Masculino', 'Feminino', 'Prefiro não optar']
                  .map((sexo) =>
                      DropdownMenuItem(value: sexo, child: Text("$sexo")))
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
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          child: FlatButton(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.white)),
            onPressed: () {
              controller.submitForm(context);
              final snackbar = SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Usuário criado com sucesso!'),
              );
              Scaffold.of(context).showSnackBar(snackbar);
            },
            child: Text(
              'Cadastrar',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter Medium',
                  fontSize: 18),
            ),
          ),
        )
      ],
    );
  }
}
