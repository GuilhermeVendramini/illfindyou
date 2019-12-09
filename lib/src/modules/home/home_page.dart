import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-drawer.dart';

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
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}
