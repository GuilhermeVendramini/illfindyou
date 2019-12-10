import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/widgets/blocks/pick-image-block.dart';
import 'package:illfindyou/src/shared/widgets/components/default-drawer.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:illfindyou/src/shared/widgets/components/floating-action-button-picker-image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: DefaultTitle(
          fontSize: 20.0,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                PickImageBlock(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonPickerImage(),
    );
  }
}
