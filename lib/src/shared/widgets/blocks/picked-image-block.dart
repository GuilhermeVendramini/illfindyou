import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:illfindyou/src/shared/widgets/components/image-aspect-ratio.dart';
import 'package:provider/provider.dart';

class PickedImageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);
    _controller.pickImageState = PickImageState.IDLE;

    return Container(
      padding: EdgeInsets.all(20.0),
      child: Observer(
        builder: (_) {
          switch (_controller.pickImageState) {
            case PickImageState.LOADING:
              return CircularProgressIndicator();
              break;
            case PickImageState.SUCCESS:
              return ImageAspectRatio(
                image: Image.file(_controller.imageFile).image,
              );
              break;
            case PickImageState.FAIL:
            case PickImageState.IDLE:
            default:
              return Column(
                children: <Widget>[
                  Text(
                    "Did you find anyone?",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Upload the person's photo and we'll try to find some information",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
