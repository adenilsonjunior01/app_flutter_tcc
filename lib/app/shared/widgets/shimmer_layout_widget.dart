import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double containerWidth = 150;
    double containerHeight = 15;

    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 80,
            width: 130,
            color: Colors.grey,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth,
                color: Colors.grey,
              ),
              SizedBox(height: 5),
              Container(
                height: containerHeight,
                width: containerWidth * 0.75,
                color: Colors.grey,
              )
            ],
          )
        ],
      ),
    );
  }
}

// Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 15),
//                           child: SizedBox(
//                             width: MediaQuery.of(context).size.width,
//                             height: 100.0,
//                             child: Shimmer.fromColors(
//                                 highlightColor: Colors.white,
//                                 baseColor: Colors.grey[300],
//                                 child: ShimmerLayout()),
//                           ),
//                         ),
