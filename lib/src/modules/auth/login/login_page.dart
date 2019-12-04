import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<LoginController>(context);

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background01.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Observer(
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
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Observer(
                builder: (_) {
                  return AnimatedCrossFade(
                    alignment: Alignment.center,
                    duration: Duration(seconds: 2),
                    crossFadeState: _controller.startedAnimation != null &&
                            _controller.startedAnimation
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "I'LL FIND",
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6.0),
                          padding: EdgeInsets.symmetric(horizontal: 6.0),
                          color: DefaultColors.white,
                          child: Text(
                            'YOU',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                              color: DefaultColors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    secondChild: Container(),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
