import 'package:app_tcc/app/modules/registros/registro_status_request.dart';
import 'package:app_tcc/app/shared/widgets/loading-lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dados_medicos_controller.dart';
import 'package:intl/intl.dart';

class DadosMedicosPage extends StatefulWidget {
  final String title;
  const DadosMedicosPage({Key key, this.title = "Dados Médicos"})
      : super(key: key);

  @override
  _DadosMedicosPageState createState() => _DadosMedicosPageState();
}

class _DadosMedicosPageState
    extends ModularState<DadosMedicosPage, DadosMedicosController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getTiposAlergia(context);
    controller.getTipoProcedimentos(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xFF388AF7),
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Observer(
              builder: (context) {
                if (controller.status == RegistroStatusRequest.loading) {
                  return LoadingLottie();
                } else {
                  return Column(
                    children: <Widget>[
                      _title(context),
                      _dadosUser(context),
                      _dadosImc(context),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      _accordionMedicamentos(context),
                      _accordionDoencasCronicas(context),
                      _accordionAlergias(context),
                      _accordionProcedimentosMedicos(context)
                    ],
                  );
                }
              },
            )
          ],
        ));
  }

  _title(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      alignment: Alignment.center,
      child: Text(
        'Detalhamento',
        style: TextStyle(
            color: Color(0xFF3B4349),
            fontSize: 25,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  _dadosUser(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 15, left: 15, top: 8, bottom: 5),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Tipo sanguíneo: ',
                      style: TextStyle(
                          color: Color(0xFF3B4349),
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                  Builder(
                    builder: (context) {
                      return Text(
                          controller.listDadosMedicos[0].tipoSanguineo == null
                              ? 'Sem registro'
                              : controller.listDadosMedicos[0].tipoSanguineo
                                  .descricaoTipoSanguineo,
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                              fontWeight: FontWeight.bold));
                    },
                  ),
                ],
              ),
              Observer(builder: (_) {
                if (controller.isMedico == false) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () =>
                          Modular.link.pushNamed('/meus-dados-medicos'),
                      color: Color(0xFF2E3A59),
                      icon: Icon(Icons.edit),
                    ),
                  );
                } else {
                  return Text('');
                }
              })
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text('Data atualização: ',
                  style: TextStyle(
                      color: Color(0xFF3B4349),
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              Builder(
                builder: (context) {
                  return Text(
                      controller.listDadosMedicos[0].dtAtualizacao == null
                          ? ''
                          : controller.listDadosMedicos[0].dtAtualizacao,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          fontWeight: FontWeight.bold));
                },
              ),
            ],
          ),
          Observer(
            builder: (context) {
              if (controller.isMedico == true) {
                return Row(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text('Profissional: ',
                        style: TextStyle(
                            color: Color(0xFF3B4349),
                            fontSize: 14,
                            fontWeight: FontWeight.bold)),
                    Builder(
                      builder: (context) {
                        return Text(
                            controller.listDadosMedicos[0].profissionalSaude ==
                                    null
                                ? 'Sem registro'
                                : controller
                                    .listDadosMedicos[0].profissionalSaude,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                                fontWeight: FontWeight.bold));
                      },
                    ),
                  ],
                );
              } else {
                return Text('');
              }
            },
          ),
        ],
      ),
    );
  }

  _dadosImc(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/profile/icon_altura.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Builder(
                          builder: (context) {
                            return Text(
                              controller.listDadosMedicos[0].altura == null
                                  ? '0'
                                  : '${controller.listDadosMedicos[0].altura}',
                              style: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14),
                            );
                          },
                        ),
                        Text('Altura',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
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
                        Builder(
                          builder: (context) {
                            return Text(
                              controller.listDadosMedicos[0].peso == null
                                  ? '0'
                                  : '${controller.listDadosMedicos[0].peso}',
                              style: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14),
                            );
                          },
                        ),
                        Text(
                          'Peso',
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
                        Builder(
                          builder: (context) {
                            return Text(
                              controller.listDadosMedicos[0].idade == null
                                  ? '0'
                                  : '${controller.listDadosMedicos[0].idade}',
                              style: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14),
                            );
                          },
                        ),
                        Text('Idade',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/profile/icon_person_imc.png'),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Builder(
                          builder: (context) {
                            return Text(
                                controller.listDadosMedicos[0].vlImc == null
                                    ? 'Sem registro'
                                    : '${controller.listDadosMedicos[0].vlImc}',
                                style: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14));
                          },
                        ),
                        Text('IMC',
                            style:
                                TextStyle(color: Colors.black54, fontSize: 12)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
          Observer(builder: (_) {
            return Container(
              padding: EdgeInsets.only(
                top: 15,
              ),
              child: Row(
                children: [
                  Text(
                    'Descrição IMC: ',
                    style: TextStyle(
                        color: Color(0xFF3B4349),
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    controller.listDadosMedicos[0].descImc == null
                        ? 'Sem registro'
                        : controller.listDadosMedicos[0].descImc,
                    style: TextStyle(color: Color(0xFF3B4349), fontSize: 14),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  _accordionMedicamentos(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(5, 8), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            border: Border.all(color: Colors.black12)),
        child: SingleChildScrollView(
          child: ExpansionTile(
            title: Text('Medicamentos'),
            backgroundColor: Color(0xFFF4F4F4),
            children: [
              Observer(
                builder: (context) {
                  return Column(
                    children: [
                      Builder(
                        builder: (context) {
                          // recebe parametro que valida se é médico
                          if (controller.isMedico == true) {
                            return _buttonCadastroMedDoencasCronicas(context,
                                tipo: 'medicamento',
                                placeholder: 'Descrição do Medicamento');
                          } else {
                            return Container(
                              child: Text(''),
                            );
                          }
                        },
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: controller.listDadosMedicos.length,
                          itemBuilder: (_, index) {
                            var list = controller.listDadosMedicos[index];
                            return ListView.separated(
                                separatorBuilder: (context, index) => Divider(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                shrinkWrap: true,
                                itemCount: controller.listDadosMedicos[index]
                                    .medicamentos.length,
                                itemBuilder: (_, i) {
                                  return Container(
                                      child: ListTile(
                                    leading: Builder(
                                      builder: (context) {
                                        if (list.medicamentos[i]
                                                .profissionalSaude !=
                                            null) {
                                          return Image.asset(
                                            'assets/images/logo.png',
                                            height: 35,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.perm_identity,
                                            color: Color(0xFF2E3A59),
                                            size: 30,
                                          );
                                        }
                                      },
                                    ),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Builder(
                                          builder: (context) {
                                            if (list.medicamentos[i]
                                                    .profissionalSaude !=
                                                null) {
                                              return Text(
                                                  "Médico: ${list.medicamentos[i].profissionalSaude}");
                                            } else {
                                              return Text('');
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                    title: Text(list.medicamentos[i]
                                                .descMedicamento ==
                                            null
                                        ? ''
                                        : list.medicamentos[i].descMedicamento),
                                    // leading: ,
                                  ));
                                });
                          })
                    ],
                  );
                },
              )
            ],
          ),
        ));
  }

  _accordionDoencasCronicas(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(5, 8), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(color: Colors.black12)),
      child: ExpansionTile(
        backgroundColor: Color(0xFFF4F4F4),
        title: Text('Doenças Crônicas'),
        children: [
          Observer(
            builder: (context) {
              return Column(
                children: [
                  Builder(
                    builder: (context) {
                      // recebe parametro que valida se é médico
                      if (controller.isMedico == true) {
                        return _buttonCadastroMedDoencasCronicas(context,
                            tipo: 'doenca-cronica', placeholder: 'Descrição');
                      } else {
                        return Container(
                          child: Text(''),
                        );
                      }
                    },
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.listDadosMedicos.length,
                      itemBuilder: (_, index) {
                        var list = controller.listDadosMedicos[index];
                        return ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                                  height: 1,
                                  color: Colors.black,
                                ),
                            shrinkWrap: true,
                            itemCount: controller
                                .listDadosMedicos[index].doencasCronicas.length,
                            itemBuilder: (_, i) {
                              return Container(
                                  child: ListTile(
                                leading: Builder(
                                  builder: (context) {
                                    if (list.doencasCronicas[i]
                                            .profissionalSaude !=
                                        null) {
                                      return Image.asset(
                                        'assets/images/logo.png',
                                        height: 35,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.perm_identity,
                                        color: Color(0xFF2E3A59),
                                        size: 30,
                                      );
                                    }
                                  },
                                ),
                                title: Text(
                                    list.doencasCronicas[i].descDoenca == null
                                        ? ''
                                        : list.doencasCronicas[i].descDoenca),
                                subtitle: Builder(
                                  builder: (context) {
                                    if (list.doencasCronicas[i]
                                            .profissionalSaude !=
                                        null) {
                                      return Text(
                                          "Médico: ${list.doencasCronicas[i].profissionalSaude}");
                                    } else {
                                      return Text('');
                                    }
                                  },
                                ),
                                // leading: ,
                              ));
                            });
                      }),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  _accordionAlergias(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 7,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(color: Colors.black12)),
      child: ExpansionTile(
        title: Text('Alergias'),
        backgroundColor: Color(0xFFF4F4F4),
        children: [
          Observer(
            builder: (context) {
              return Column(
                children: [
                  Builder(
                    builder: (context) {
                      if (controller.isMedico == true) {
                        return _buttonCadastroAlergia(context);
                      } else {
                        return Container(
                          child: Text(''),
                        );
                      }
                    },
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.listDadosMedicos.length,
                      itemBuilder: (_, index) {
                        var list = controller.listDadosMedicos[index];

                        return ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                                  height: 1,
                                  color: Colors.black,
                                ),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller
                                .listDadosMedicos[index].alergias.length,
                            itemBuilder: (_, i) {
                              return Container(
                                  child: ListTile(
                                leading: Builder(
                                  builder: (context) {
                                    if (list.alergias[i].profissionalSaude !=
                                        null) {
                                      return Image.asset(
                                        'assets/images/logo.png',
                                        height: 35,
                                      );
                                    } else {
                                      return Icon(
                                        Icons.perm_identity,
                                        color: Color(0xFF2E3A59),
                                        size: 30,
                                      );
                                    }
                                  },
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        list.alergias[i].tipoAlergia.descTipo ==
                                                null
                                            ? ''
                                            : list.alergias[i].tipoAlergia
                                                .descTipo),
                                    Builder(
                                      builder: (context) {
                                        if (list.alergias[i]
                                                .profissionalSaude !=
                                            null) {
                                          return Text(
                                              "Médico: ${list.alergias[i].profissionalSaude}");
                                        } else {
                                          return Text('');
                                        }
                                      },
                                    )
                                  ],
                                ),
                                title: Text(list.alergias[i].descAlergia == null
                                    ? ''
                                    : list.alergias[i].descAlergia),

                                // leading: ,
                              ));
                            });
                      }),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  _accordionProcedimentosMedicos(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.8),
              spreadRadius: 10,
              blurRadius: 7,
              offset: Offset(0, 8), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          border: Border.all(color: Colors.black12)),
      child: ExpansionTile(
        title: Text('Procedimentos Médicos'),
        backgroundColor: Color(0xFFF4F4F4),
        children: [
          Observer(
            builder: (context) {
              return Column(
                children: [
                  Builder(
                    builder: (context) {
                      if (controller.isMedico == true) {
                        return _buttonCadastroProcedimentoMedico(context);
                      } else {
                        return Container(
                          child: Text(''),
                        );
                      }
                    },
                  ),
                  ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: Colors.black,
                          ),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: controller.listProcedimentosMedicos.length,
                      itemBuilder: (_, index) {
                        var list = controller.listProcedimentosMedicos[index];
                        return Container(
                            child: ListTile(
                          leading: Builder(
                            builder: (context) {
                              if (list.nomeProfSaude == null) {
                                return Icon(
                                  Icons.perm_identity,
                                  color: Color(0xFF2E3A59),
                                  size: 30,
                                );
                              } else {
                                return Image.asset(
                                  'assets/images/logo.png',
                                  height: 35,
                                );
                              }
                            },
                          ),
                          title: Text(list.titulo == null ? '' : list.titulo),
                          subtitle: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(list.titulo == null ? '' : list.titulo),
                              Builder(
                                builder: (context) {
                                  if (list.nomeProfSaude != null) {
                                    return Text(
                                        "Médico: ${list.nomeProfSaude == null ? '' : list.nomeProfSaude}");
                                  } else {
                                    return Text('');
                                  }
                                },
                              )
                            ],
                          ),
                          // leading: ,
                        ));
                      }),
                ],
              );
            },
          )
        ],
      ),
    );
  }

// Dialog de edição de Medicamento e Doença Crônica
  _dialogCadastroMedicamento(BuildContext context,
      {String tipo, String placeholder}) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Builder(
              builder: (context) {
                if (tipo == 'medicamento') {
                  return Text(
                    "Cadastrar Medicamento",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3F414E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  );
                } else {
                  return Text(
                    "Cadastrar Doença Crônica",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3F414E),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            content: Builder(
              builder: (context) {
                if (tipo == 'medicamento') {
                  return FormBuilder(
                    key: controller.formBuildKey,
                    child: FormBuilderTextField(
                        attribute: placeholder,
                        controller: controller.descMedicamento,
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Campo obrigatório')
                        ],
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(13),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFA49FBB))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFA49FBB),
                                )),
                            // hintText: "Descrição do medicamento",
                            hintText: placeholder,
                            hintStyle: TextStyle(
                                color: Color(0xFF3B4349), fontSize: 14))),
                  );
                } else {
                  return FormBuilder(
                    key: controller.formBuildKey,
                    child: FormBuilderTextField(
                        attribute: placeholder,
                        controller: controller.descDoenca,
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'Campo obrigatório')
                        ],
                        decoration: InputDecoration(
                            // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                            contentPadding: EdgeInsets.all(13),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFFA49FBB))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: Color(0xFFA49FBB),
                                )),
                            // hintText: "Descrição do medicamento",
                            hintText: placeholder,
                            hintStyle: TextStyle(
                                color: Color(0xFF3B4349), fontSize: 14))),
                  );
                }
              },
            ),
            actions: <Widget>[
              Observer(
                builder: (context) {
                  if (tipo == 'medicamento') {
                    return Row(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            controller.cadastroMedicamento(context);
                          },
                          child: Text('Salvar'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        )
                      ],
                    );
                  } else {
                    return Row(
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                            controller.cadastroDoencaCronica(context);
                          },
                          child: Text('Salvar'),
                        ),
                        FlatButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancelar'),
                        )
                      ],
                    );
                  }
                },
              )
            ],
          );
        });
  }

  _dialogCadastroAlergia(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Cadastrar Alergias",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
                height: 220,
                child: SingleChildScrollView(
                  child: FormBuilder(
                    key: controller.formBuildKey,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                            attribute: 'Descrição da Alergia',
                            controller: controller.descAlergia,
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: 'Campo obrigatório')
                            ],
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
                                hintText: 'Descrição da Alergia',
                                hintStyle: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14))),
                        SizedBox(
                          height: 10,
                        ),
                        FormBuilderDropdown(
                            attribute: 'Tipo de alergia',
                            validators: [
                              FormBuilderValidators.required(
                                  errorText: 'Campo obrigatório')
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                controller.tipoAlergia = newValue.id;
                              });
                            },
                            items: controller.listTiposAlergia
                                .toList()
                                .map((tipoAlergia) => DropdownMenuItem(
                                    value: tipoAlergia,
                                    child: Text("${tipoAlergia.descTipo}")))
                                .toList(),
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
                                hintText: 'Tipo da alergia',
                                hintStyle: TextStyle(
                                    color: Color(0xFF3B4349), fontSize: 14))),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                )),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.cadastroAlergia(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }

  _buttonCadastroMedDoencasCronicas(BuildContext context,
      {String tipo, String placeholder}) {
    return Wrap(
      children: [
        ButtonTheme(
          child: FlatButton(
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color(0xFFA49FBB))),
            onPressed: () {
              _dialogCadastroMedicamento(context,
                  tipo: tipo, placeholder: placeholder);
            },
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
  }

  _buttonCadastroAlergia(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xFFA49FBB))),
        onPressed: () => _dialogCadastroAlergia(context),
        child: Text(
          'Cadastrar',
          style: TextStyle(
              color: Color(0xFF3B4349),
              fontFamily: 'Inter Medium',
              fontSize: 14),
        ),
      ),
    );
  }

  _buttonCadastroProcedimentoMedico(BuildContext context) {
    return ButtonTheme(
      child: FlatButton(
        padding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xFFA49FBB))),
        onPressed: () => _dialogCadastroProcedimentoMedico(context),
        child: Text(
          'Cadastrar',
          style: TextStyle(
              color: Color(0xFF3B4349),
              fontFamily: 'Inter Medium',
              fontSize: 14),
        ),
      ),
    );
  }

  _dialogCadastroProcedimentoMedico(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text(
              "Cadastrar Alergias",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3F414E),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            content: Container(
                height: 220,
                child: SingleChildScrollView(
                    child: FormBuilder(
                  key: controller.formBuildKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                          attribute: 'Título',
                          controller: controller.titulo,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigatório')
                          ],
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA49FBB),
                                  )),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Título',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderDropdown(
                          attribute: 'Tipo de procedimento',
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigatório')
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              controller.idTipoProcedimento = newValue.id;
                            });
                          },
                          items: controller.listTipoProcedimentos
                              .toList()
                              .map((tipo) => DropdownMenuItem(
                                  value: tipo,
                                  child: Text("${tipo.descTipoProcedimeto}")))
                              .toList(),
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Tipo da procedimento',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                          attribute: 'Local (opcional)',
                          controller: controller.descLocal,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA49FBB),
                                  )),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Local (opcional)',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderDateTimePicker(
                          attribute: 'Data de procedimento',
                          inputType: InputType.date,
                          format: DateFormat("dd-MM-yyyy"),
                          style: TextStyle(color: Color(0xFF3B4349)),
                          controller: controller.dtProcedimento,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigatório')
                          ],
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA49FBB),
                                  )),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Data de procedimento',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderDateTimePicker(
                          attribute: 'Data do Retorno (opcional)',
                          inputType: InputType.date,
                          format: DateFormat("dd-MM-yyyy"),
                          style: TextStyle(color: Color(0xFF3B4349)),
                          controller: controller.dtRetorno,
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA49FBB),
                                  )),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Data do Retorno (opcional)',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                      SizedBox(
                        height: 10,
                      ),
                      FormBuilderTextField(
                          attribute: 'Descrição',
                          controller: controller.descricao,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigatório')
                          ],
                          decoration: InputDecoration(
                              // border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                              contentPadding: EdgeInsets.all(13),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFFA49FBB))),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(
                                    color: Color(0xFFA49FBB),
                                  )),
                              // hintText: "Descrição do medicamento",
                              hintText: 'Descrição',
                              hintStyle: TextStyle(
                                  color: Color(0xFF3B4349), fontSize: 14))),
                    ],
                  ),
                ))),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  controller.cadastroProcedimentoMedico(context);
                },
                child: Text('Salvar'),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancelar'),
              )
            ],
          );
        });
  }
}
