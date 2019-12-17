import 'package:flutter/material.dart';
import 'package:illfindyou/src/models/missing_model.dart';
import 'package:provider/provider.dart';

import 'missing_controller.dart';
import 'missing_page.dart';

class MissingModule extends StatelessWidget {
  final MissingModel missing;

  MissingModule({@required this.missing});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<MissingController>(
            create: (_) => MissingController(missing: missing)),
      ],
      child: MissingPage(),
    );
  }
}
