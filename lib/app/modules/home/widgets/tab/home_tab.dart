import 'package:app_tcc/app/modules/home/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  HomeController controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.jwtDecode();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/form/bg_cadastro.png'),
              fit: BoxFit.cover)),
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
                    'Início',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xFF3B4349),
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                ),
              )
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 100,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.only(),
                width: 330,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                    color: Color(0xFFF4F4F4)),
                child: Column(
                  children: [
                    // SvgPicture.asset(
                    //   'assets/images/logo.svg',
                    //   height: 80,
                    // )
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Observer(builder: (_) {
                        return Text(
                          controller.users,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter Medium',
                            fontSize: 20,
                            color: Color(0xFF121212),
                          ),
                        );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Text(
                        "Ativo desde: Administrador",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFB4B4B4)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Divider(
                        color: Color(0xFFE3E9F8),
                        height: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Column(
                            children: [
                              Text("Alergia"),
                              Icon(Icons.record_voice_over),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Column(
                            children: [
                              Text("Medicamento"),
                              Icon(Icons.local_hospital)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          child: Column(
                            children: [
                              Text('Doenças \nCrônicas'),
                              Icon(Icons.sync_problem)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
