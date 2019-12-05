import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/core/app_controller.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:provider/provider.dart';

class AnimatedColorBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Observer(
      builder: (_) {
        return AnimatedContainer(
          curve: Curves.easeIn,
          duration: Duration(seconds: 4),
          color: _controller.startedAnimation != null &&
              _controller.startedAnimation
              ? DefaultColors.transparent
              : DefaultColors.black,
        );
      },
    );
  }
}
