import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final _controller = Provider.of<HomeController>(context);

    return Scaffold(
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
