import 'package:flutter/material.dart';

class ImageBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background01.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
