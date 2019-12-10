import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/blocks/picked-image-block.dart';
import 'package:illfindyou/src/shared/widgets/components/default-drawer.dart';
import 'package:illfindyou/src/shared/widgets/components/floating-action-button-picker-image.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DefaultDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text(Strings.appTitle),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                PickedImageBlock(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButtonPickerImage(),
    );
  }
}
