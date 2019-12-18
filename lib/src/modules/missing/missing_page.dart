import 'package:flutter/material.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/default-title.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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
                height: 40.0,
              ),
              Text(
                _controller.missing.name,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
              Divider(
                height: 20.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                _controller.missing.body,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                Strings.missingContactUs,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                Strings.missingContactUsMessage,
                style: TextStyle(
                  fontSize: 12.0,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: DefaultColors.grey,
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            _controller.missing.phone,
                            style: TextStyle(
                              color: DefaultColors.cyan,
                            ),
                          ),
                          onTap: () async {
                            if (await canLaunch(
                                'tel:${_controller.missing.phone}')) {
                              await launch('tel:${_controller.missing.phone}');
                            } else {
                              throw 'Could not launch tel:${_controller.missing.phone}';
                            }
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(Icons.phone),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          child: Text(
                            _controller.missing.email,
                            style: TextStyle(
                              color: DefaultColors.cyan,
                            ),
                          ),
                          onTap: () async {
                            if (await canLaunch(
                                'mailto:${_controller.missing.email}')) {
                              await launch(
                                  'mailto:${_controller.missing.email}');
                            } else {
                              throw 'Could not launch email:${_controller.missing.email}';
                            }
                          },
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Icon(Icons.email),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
