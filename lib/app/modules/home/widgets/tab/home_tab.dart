import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildHome() => Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/home/bg_inicio.png'),
                  fit: BoxFit.cover)),
        );

    return Stack(
      children: [
        _buildHome(),
        CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Início', textAlign: TextAlign.center),
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
                    child: Text(
                      "Adenilson Souza Santos Junior",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter Medium',
                        fontSize: 22,
                        color: Color(0xFF121212),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Text(
                      "Perfil: Administrador",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Color(0xFFB4B4B4)),
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
                            Icon(Icons.record_voice_over)
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
    );
  }
}
