import 'package:flutter/cupertino.dart';

class TitleListaWidget extends StatelessWidget {
  final String title;

  TitleListaWidget(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        padding: EdgeInsets.only(top: 20, left: 15),
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
              color: Color(0xFF3B4349),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
