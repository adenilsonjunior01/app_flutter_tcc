import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class CustomErrorRequestWidget extends StatelessWidget {
  String message;
  CustomErrorRequestWidget({this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          Lottie.asset('assets/lotties-animation/error-request.json',
              height: 100),
          Text(message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3B4349),
                fontSize: 16,
              )),
        ],
      ),
    );
  }
}
