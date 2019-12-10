import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class ImageAspectRatio extends StatelessWidget {

  final ImageProvider image;

  ImageAspectRatio({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: DefaultColors.white),
            image: DecorationImage(
              image: image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
