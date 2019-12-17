import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/components/default_carousel.dart';
import 'missing_controller.dart';

class MissingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<MissingController>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DefaultTitle(
          fontSize: 20.0,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: <Widget>[
              DefaultCarousel(),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _controller.missing.name,
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
