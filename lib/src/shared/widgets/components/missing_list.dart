import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

import 'missing_card.dart';

class MissingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _controller = Provider.of<HomeController>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: _controller.missingList.length,
      itemBuilder: (BuildContext context, int index) {
        return MissingCard(
          missing: _controller.missingList[index],
        );
      },
    );
  }
}