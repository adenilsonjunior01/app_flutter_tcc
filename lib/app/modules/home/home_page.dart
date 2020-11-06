import 'package:app_tcc/app/modules/home/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:random_color/random_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(context2: context, controller: controller),
    );
  }
}

avatarItem(String nome, {String imagem}) {
  RandomColor _randomColor = RandomColor();
  Color _color = _randomColor.randomColor(
      colorBrightness: ColorBrightness.light, colorHue: ColorHue.blue);

  var primeiraLetra = nome[0].toUpperCase();
  return CircleAvatar(
      backgroundColor: _color,
      foregroundColor: Colors.black,
      radius: 28,
      child: Text(primeiraLetra,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)));
}

// return Column(
//       children: [
//         Container(
//             height: 250,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/home/bg_header.png'),
//                     fit: BoxFit.fill)),
//             child: SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(15, 70, 10, 10),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         Text(
//                           'Nome do Usuário',
//                           style: TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                         ),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 50),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Status',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white),
//                           ),
//                           Padding(
//                               padding: const EdgeInsets.only(right: 20),
//                               child: Container(
//                                 decoration: new BoxDecoration(
//                                   shape: BoxShape.circle,
//                                   border: new Border.all(
//                                     color: Color(0xFF007AFE),
//                                     width: 1,
//                                   ),
//                                 ),
//                                 child: avatarItem(
//                                   'teste',
//                                 ),
//                               ))
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )),
//         Container(
//           decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   color: Colors.black54, offset: Offset(2, 2), blurRadius: 4)
//             ],
//             borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(10.0),
//                 bottomLeft: Radius.circular(10.0)),
//             color: Colors.red,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [Text('Icon One'), Text('Icon two'), Text('Icon three')],
//           ),
//         )
//       ],
//     );
