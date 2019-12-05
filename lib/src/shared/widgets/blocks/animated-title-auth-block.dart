import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/core/app_controller.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:provider/provider.dart';

import 'login_register_block.dart';

class AnimatedTitleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Observer(
        builder: (_) {
          return AnimatedCrossFade(
            alignment: Alignment.center,
            duration: Duration(seconds: 3),
            crossFadeState: _controller.startedAnimation != null &&
                    _controller.startedAnimation
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DefaultTitle(),
                LoginRegisterBlock(),
              ],
            ),
            secondChild: Container(),
          );
        },
      ),
    );
  }
}
