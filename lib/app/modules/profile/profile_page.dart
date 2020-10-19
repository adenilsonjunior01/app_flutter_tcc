import 'package:app_tcc/app/modules/profile/profile_status_request.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_color/random_color.dart';
import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.jwtDecode();
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
        colorBrightness: ColorBrightness.light, colorHue: ColorHue.blue);
    return Container(
      height: _altura,
      width: _largura,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/form/bg_cadastro.png'),
              fit: BoxFit.fill)),
      child: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3B4349),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                ),
              ),
            ],
          ),
          Container(
              height: _altura,
              padding: EdgeInsets.only(top: 110),
              child: Observer(builder: (_) {
                if (controller.status == ProfileStatusRequest.loading) {
                  return LoadingLottie();
                } else if (controller.status == ProfileStatusRequest.success ||
                    controller.status == ProfileStatusRequest.none) {
                  return Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: _color,
                        foregroundColor: _color,
                        radius: 55,
                        child: Text(
                          controller.firstLetter,
                          style: TextStyle(color: Colors.white, fontSize: 38),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, bottom: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                controller.users.toUpperCase() != null
                                    ? controller.users.toUpperCase()
                                    : '',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 20),
                              ),
                              flex: 3,
                            ),
                            Flexible(
                              flex: 1,
                              child: IconButton(
                                icon: Icon(Icons.edit, color: Colors.grey),
                                onPressed: () {
                                  _dialog(context);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Text(
                        controller.email != null ? controller.email : '',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black38, fontSize: 14),
                      )
                    ],
                  );
                } else {
                  return Text(
                    controller.users != null
                        ? controller.users.toUpperCase()
                        : '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter Medium',
                      fontSize: 20,
                      color: Color(0xFF121212),
                    ),
                  );
                }
              }))
        ],
      ),
    );
  }

  _dialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Editar Perfil",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              child: SingleChildScrollView(
                child: FormBuilder(
                  key: controller.formBuilderKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                          attribute: 'Nome completo',
                          controller: controller.nameUser,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Nome completo',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                          attribute: 'Telefone',
                          controller: controller.telUser,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Telefone',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                    ],
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  controller.editUser(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  controller.clearInputDesMedicamento();
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }
}
