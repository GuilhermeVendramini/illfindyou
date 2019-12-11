import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illfindyou/src/core/app_controller.dart';
import 'package:illfindyou/src/core/app_module.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:provider/provider.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);
    final _textDrawerStyle = TextStyle(
      fontSize: 20.0,
    );

    return Container(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: _controller.userName != null
                    ? Text(
                        _controller.userName,
                        style: _textDrawerStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )
                    : Text(
                        Strings.welcome,
                        style: _textDrawerStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text(Strings.appReportMissing),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text(Strings.logout),
              onTap: () async {
                final bool _result = await _controller.logout();
                if (_result) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppModule()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
