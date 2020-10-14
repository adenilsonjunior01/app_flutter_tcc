import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'edit_profile_controller.dart';

class EditProfilePage extends StatefulWidget {
  final String title;
  const EditProfilePage({Key key, this.title = "EditProfile"})
      : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends ModularState<EditProfilePage, EditProfileController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
