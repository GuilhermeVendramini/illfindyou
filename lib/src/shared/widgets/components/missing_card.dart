import 'package:flutter/material.dart';
import 'package:illfindyou/src/models/missing_model.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class MissingCard extends StatelessWidget {
  final MissingModel missing;

  MissingCard({@required this.missing});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(right: 20.0),
      color: DefaultColors.white,
      child: Column(
        children: <Widget>[
          Text(
            missing.name,
            style: TextStyle(
              color: DefaultColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
