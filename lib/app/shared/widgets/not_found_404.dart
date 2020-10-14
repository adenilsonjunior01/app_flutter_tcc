import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class NotFound404 extends StatefulWidget {
  String message;
  NotFound404({this.message});

  @override
  _NotFound404State createState() => _NotFound404State();
}

class _NotFound404State extends State<NotFound404> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Lottie.asset('assets/lotties-animation/not-found-404.json',
              height: 80),
          SizedBox(
            height: 10,
          ),
          Text(widget.message,
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
