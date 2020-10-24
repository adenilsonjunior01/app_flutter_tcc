import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerTile extends StatelessWidget {
  final String icon;
  final String text;
  final PageController pageController;
  final int page;
  final Widget logout;

  DrawerTile(this.icon, this.text, this.pageController, this.page,
      {this.logout});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pop();
          pageController.jumpToPage(page);
        },
        child: Container(
          height: 50,
          padding: EdgeInsets.only(left: 23),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/images/home/${icon}',
                color: pageController.page.round() == page
                    ? Theme.of(context).primaryColor
                    : null,
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF222222),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
