import 'package:flutter/material.dart';

class DefaultSnackBar extends SnackBar {
  final Widget content;

  DefaultSnackBar({@required this.content}) : super(content: content);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: content,
    );
  }
}
