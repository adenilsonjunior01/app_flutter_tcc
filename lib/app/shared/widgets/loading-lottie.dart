import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class LoadingLottie extends StatefulWidget {
  LoadingLottie({Key key}) : super(key: key);

  @override
  _LoadingLottieState createState() => _LoadingLottieState();
}

class _LoadingLottieState extends State<LoadingLottie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties-animation/loading.json', height: 120),
          Text(
            'Aguarde...',
            style: TextStyle(color: Color(0xFF3B4349), fontSize: 18),
          )
        ],
      ),
    );
  }
}
