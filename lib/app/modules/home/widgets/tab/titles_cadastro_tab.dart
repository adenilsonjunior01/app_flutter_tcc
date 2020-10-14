import 'package:app_tcc/app/modules/home/widgets/tiles/titles_cadastro_tile.dart';
import 'package:app_tcc/app/shared/utils/list_title_cadastro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TitlesCadastroTab extends StatelessWidget {
  dynamic lista = [
    {"id": 1, "name": "Alergia", "icon": ""},
    {"id": 2, "name": "Doença Crônica", "icon": ""},
    {"id": 3, "name": "Medicamento", "icon": ""},
  ];
  @override
  Widget build(BuildContext context) {
    var dividedTiles =
        ListTile.divideTiles(context: context, color: Colors.grey[500], tiles: [
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          lista[0]['name'],
          style: TextStyle(
              color: Color(0xFF222222),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Modular.link.pushNamed('/registro/alergia');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          lista[1]['name'],
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Modular.link.pushNamed('/registro/doenca-cronica');
        },
      ),
      ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.transparent,
        ),
        title: Text(lista[2]['name'],
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          // Navigator.pushNamed(context, '/registros/medicamento');
          Modular.link.pushNamed('/registro/medicamento');
        },
      ),
    ]).toList();
    return ListView(
      children: dividedTiles,
    );
  }
}
