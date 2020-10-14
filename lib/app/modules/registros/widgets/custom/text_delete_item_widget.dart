import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TexteDeleteItemWidget extends StatelessWidget {
  const TexteDeleteItemWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 15, top: 10, right: 15),
      child: Text(
        'Para excluir, arraste o item na Lista da esquerda para direita.',
        style: TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}
