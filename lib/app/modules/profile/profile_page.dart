import 'package:app_tcc/app/modules/profile/profile_status_request.dart';
import 'package:app_tcc/app/shared/widgets/custom-error-request-widget.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:app_tcc/app/widgets/nav_bar_silver_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
    controller.getProcedimentosMedicos(context);
  }

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: _altura,
        width: _largura,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage('assets/images/form/bg_cadastro.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            NavBarSilverWidget(),
            Container(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                  ),
                  Observer(builder: (_) {
                    if (controller.status == ProfileStatusRequest.loading) {
                      return LoadingLottie();
                    } else if (controller.status ==
                            ProfileStatusRequest.success ||
                        controller.status == ProfileStatusRequest.none) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _header(context),
                          _subHeader(context),
                          _detailsUser(context),
                          _carousel(context)
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
                  }),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  _header(BuildContext context) {
    RandomColor _randomColor = RandomColor();
    Color _color = _randomColor.randomColor(
        colorBrightness: ColorBrightness.light, colorHue: ColorHue.blue);
    return SafeArea(
      child: Container(
        height: 120,
        width: 120,
        child: Stack(
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
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: IconButton(
                    icon: Icon(Icons.edit, size: 20, color: Color(0xFF2E3A59)),
                    onPressed: () {
                      _dialog(context);
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _subHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          controller.users.toUpperCase() != null
              ? controller.users.toUpperCase()
              : '',
          textAlign: TextAlign.center,
          style: TextStyle(color: Color(0xFF3B4349), fontSize: 20),
        ),
        Builder(
          builder: (context) {
            if (controller.perfil.length > 1) {
              return Text(
                'Perfil: ${controller.perfil[0] != null ? controller.perfil[0] : ''}, ${controller.perfil[1] != null ? controller.perfil[1] : ''}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38, fontSize: 14),
              );
            } else {
              return Text(
                'Perfil: ${controller.perfil[0] != null ? controller.perfil[0] : ''}',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black38, fontSize: 14),
              );
            }
          },
        ),
        Text(
          controller.email != null ? controller.email : '',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black38, fontSize: 14),
        ),
      ],
    );
  }

  _detailsUser(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset('assets/images/profile/icon_altura.png'),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return Text(
                          controller.listDadosMedicos[0].peso == null
                              ? '0'
                              : '${controller.listDadosMedicos[0].peso}',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 14),
                        );
                      },
                    ),
                    Text('Peso',
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset('assets/images/profile/icon_peso.png'),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return Text(
                          controller.listDadosMedicos[0].peso == null
                              ? '0'
                              : '${controller.listDadosMedicos[0].altura}',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 14),
                        );
                      },
                    ),
                    Text(
                      'Altura',
                      style: TextStyle(color: Colors.black54, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              Image.asset('assets/images/profile/icon_idade.png'),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return Text(
                          controller.listDadosMedicos[0].idade == null
                              ? '0'
                              : '${controller.listDadosMedicos[0].idade}',
                          style:
                              TextStyle(color: Color(0xFF3B4349), fontSize: 14),
                        );
                      },
                    ),
                    Text('Idade',
                        style: TextStyle(color: Colors.black54, fontSize: 12)),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _carouselTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 15, bottom: 0),
      alignment: Alignment.centerLeft,
      child: Builder(builder: (_) {
        if (controller.status2 == ProfileStatusRequest.error) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Procedimentos Médicos',
                style: TextStyle(
                    color: Color(0xFF3B4349),
                    fontSize: 16,
                    fontFamily: 'Inter Bold'),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Nenhum registro de Procedimentos Médicos encontrado!'),
              SizedBox(
                height: 8,
              ),
              ButtonTheme(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Color(0xFFA49FBB))),
                  onPressed: () =>
                      Modular.link.pushNamed('/registro/procedimento-medico'),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                        color: Color(0xFF3B4349),
                        fontFamily: 'Inter Medium',
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Text(
            'Procedimentos Médicos',
            style: TextStyle(
                color: Color(0xFF3B4349),
                fontSize: 16,
                fontFamily: 'Inter Bold'),
          );
        }
      }),
    );
  }

  _carousel(BuildContext context) {
    return Column(
      children: [
        _carouselTitle(context),
        Observer(builder: (_) {
          return Container(
            padding: EdgeInsets.only(top: 20),
            child: CarouselSlider(
              options: CarouselOptions(height: 160),
              items: controller.listProcedimentos.map((procedimento) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFF4F4F4),
                            borderRadius: BorderRadius.circular(15)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Título: ",
                                      style: TextStyle(
                                          color: Color(0xFF3B4349),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                          text:
                                              "${procedimento.titulo != null ? procedimento.titulo : 'Sem registro'}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Tipo: ",
                                      style: TextStyle(
                                          color: Color(0xFF3B4349),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      text: TextSpan(
                                          text:
                                              "${procedimento.descTipoProcedimento != null ? procedimento.descTipoProcedimento : 'Sem registro'}",
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16)),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Local: ",
                                      style: TextStyle(
                                          color: Color(0xFF3B4349),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600)),
                                  Text(
                                    "${procedimento.descLocal != null ? procedimento.descLocal : 'Sem registro'}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Data: ",
                                      style: TextStyle(
                                        color: Color(0xFF3B4349),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  Text(
                                    "${procedimento.dtProcedimento != null ? procedimento.dtProcedimento : 'Sem registro'}",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 200,
                                height: 48,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ButtonTheme(
                                      child: FlatButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                            side: BorderSide(
                                                color: Color(0xFFA49FBB))),
                                        onPressed: () {
                                          _dialogShowMore(
                                              context, procedimento);
                                        },
                                        child: Text(
                                          'Ver mais',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontFamily: 'Inter Medium',
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                    // Image.asset(
                                    //   'assets/images/logo.png',
                                    //   height: 35,
                                    // )
                                    Container(
                                      padding: EdgeInsets.only(left: 50),
                                      child: Builder(
                                        builder: (context) {
                                          if (true) {
                                            return Image.asset(
                                              'assets/images/logo.png',
                                              height: 35,
                                            );
                                          } else {
                                            return Image.asset(
                                              'assets/images/profile/icon_user.png',
                                              height: 35,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
          );
        }),
      ],
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
                  Navigator.pop(context);
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

  _dialogShowMore(BuildContext context, procedimento) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Detalhes do Procedimento",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Text("Título: ",
                          style: TextStyle(
                              color: Color(0xFF3B4349),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text:
                                  "${procedimento.titulo != null ? procedimento.titulo : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Local: ",
                          style: TextStyle(
                              color: Color(0xFF3B4349),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text:
                                  "${procedimento.descLocal != null ? procedimento.descLocal : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Tipo: ",
                          style: TextStyle(
                              color: Color(0xFF3B4349),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text:
                                  "${procedimento.descTipoProcedimento != null ? procedimento.descTipoProcedimento : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Data: ",
                          style: TextStyle(
                              color: Color(0xFF3B4349),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text:
                                  "${procedimento.dtProcedimento != null ? procedimento.dtProcedimento : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Data Retorno: ",
                          style: TextStyle(
                              color: Color(0xFF3B4349),
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      Flexible(
                        child: RichText(
                          overflow: TextOverflow.ellipsis,
                          text: TextSpan(
                              text:
                                  "${procedimento.dtRetorno != null ? procedimento.dtRetorno : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Descrição: ",
                        style: TextStyle(
                            color: Color(0xFF3B4349),
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  Row(
                    children: [
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text:
                                  "${procedimento.descricao != null ? procedimento.descricao : 'Sem registro'}",
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 16)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  _confirmDialog(context, procedimento);
                },
                child: Text('Excluir'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  Modular.link.pushNamed('/registro/procedimento-medico',
                      arguments: procedimento);
                },
                child: Text('Editar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        });
  }

  _confirmDialog(BuildContext context, procedimento) {
    Widget cancelButton = FlatButton(
      child: Text('Não'),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text('Sim, continuar'),
      onPressed: () {
        controller.deleteProcedimentoMedico(procedimento.id, context);
        Navigator.pop(context);
      },
    );
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "Excluir Procedimento",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFF3F414E),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        content: Text(
          'Essa ação não poderá ser revertida, tem certeza que deseja continuar?',
          style: TextStyle(color: Color(0xFF3B4349), fontSize: 16),
        ),
        actions: [cancelButton, continueButton],
      ),
    );
  }
}
