import 'package:flutter/material.dart';

class ImageAspectRatio extends StatelessWidget {
  final ImageProvider image;

  ImageAspectRatio({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: FadeInImage(
          image: image,
          placeholder: AssetImage('assets/images/image-loading.gif'),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
