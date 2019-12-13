import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/widgets/components/missing_list.dart';

class MissingListBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Missing list'),
        MissingList(),
      ],
    );
  }
}
