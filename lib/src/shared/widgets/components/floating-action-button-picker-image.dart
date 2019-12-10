import 'package:flutter/material.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

import 'default-snack-bar.dart';

class FloatingActionButtonPickerImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    return FloatingActionButton(
      child: const Icon(Icons.add_a_photo),
      onPressed: () async {
        PickImageState _result = await _controller.getAndScanImage();
        if (_result == PickImageState.FAIL) {
          final SnackBar _snackBar = DefaultSnackBar(
            content: Text(_controller.message),
          );
          Scaffold.of(context).showSnackBar(_snackBar);
        }
      },
    );
  }
}
