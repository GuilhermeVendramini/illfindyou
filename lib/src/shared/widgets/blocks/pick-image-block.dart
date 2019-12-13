import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:provider/provider.dart';

import 'missing-image-block.dart';

class PickImageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Observer(
        builder: (_) {
          switch (_controller.pickImageState) {
            case PickImageState.LOADING:
              return CircularProgressIndicator();
              break;
            case PickImageState.SUCCESS:
              return MissingImageBlock();
              break;
            case PickImageState.FAIL:
            case PickImageState.IDLE:
            default:
              return Column(
                children: <Widget>[
                  Text(
                    Strings.homePickImageTitle,
                    style: TextStyle(
                      fontSize: 28.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    Strings.homePickImageInformation,
                    textAlign: TextAlign.center,
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
