import 'package:flutter/material.dart';

class ImageAspectRatio extends StatelessWidget {
  final ImageProvider image;

  ImageAspectRatio({@required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280.0,
      child: AspectRatio(
        aspectRatio: 3 / 4,
        child: FadeInImage(
          image: image,
          placeholder: AssetImage('assets/images/background01.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
