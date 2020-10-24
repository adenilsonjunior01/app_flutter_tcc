import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavBarSilverWidget extends StatelessWidget {
  const NavBarSilverWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          snap: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              '',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF3B4349),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
        ),
      ],
    );
  }
}
