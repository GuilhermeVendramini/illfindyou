import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:illfindyou/src/shared/widgets/components/image-aspect-ratio.dart';
import 'package:provider/provider.dart';

class MissingImageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    return Container(
      padding: EdgeInsets.all(10.0),
      color: DefaultColors.white,
      child: Column(
        children: <Widget>[
          Text(
            'Missing',
            style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.w400,
                color: DefaultColors.black),
          ),
          SizedBox(
            height: 10.0,
          ),
          ImageAspectRatio(
            image: Image.file(_controller.imageFile).image,
          ),
        ],
      ),
    );
  }
}
