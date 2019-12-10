import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class DefaultTitle extends StatelessWidget {
  final double fontSize;

  DefaultTitle({this.fontSize = 28.0});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          color: DefaultColors.black,
          child: Text(
            "I'LL FIND",
            style: TextStyle(
              fontSize: fontSize,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 6.0),
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          color: DefaultColors.white,
          child: Text(
            'YOU',
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: DefaultColors.black,
            ),
          ),
        ),
      ],
    );
  }
}
