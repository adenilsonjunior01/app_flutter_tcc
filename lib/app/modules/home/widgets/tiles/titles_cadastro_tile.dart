import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitlesCadastroTile extends StatelessWidget {
  var name;
  var id;
  var icon;

  TitlesCadastroTile({this.name, this.id, this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(icon),
      ),
      title: Text(name),
      trailing: Icon(Icons.keyboard_arrow_right),
      onTap: () {},
    );
  }
}
