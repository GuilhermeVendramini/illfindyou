import 'package:flutter/material.dart';

class DefaultSnackBar extends SnackBar {
  final Widget content;

  DefaultSnackBar({@required this.content}) : super(content: content);

  Widget build(BuildContext context) {
    return SnackBar(
      content: content,
    );
  }
}
