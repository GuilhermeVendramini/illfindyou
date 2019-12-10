import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/core/app_controller.dart';
import 'package:illfindyou/src/core/app_module.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:provider/provider.dart';

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<AppController>(context);

    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: _controller.userName != null
                  ? Text(_controller.userName)
                  : Text(Strings.welcome),
            ),
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
    );
  }
}
