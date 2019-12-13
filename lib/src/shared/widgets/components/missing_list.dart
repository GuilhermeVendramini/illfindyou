import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class MissingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);

    return Observer(
      builder: (_) {
        switch (_controller.missingState) {
          case MissingState.LOADING:
            return CircularProgressIndicator();
            break;
          case MissingState.SUCCESS:
            return _controller.missingList != null &&
                    _controller.missingList.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    itemCount: _controller.missingList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(_controller.missingList[index].name);
                    },
                  )
                : Text('No results');
            break;
          case MissingState.FAIL:
            return Text('Fail');
            break;
          case MissingState.IDLE:
          default:
            return Container();
            break;
        }
      },
    );
  }
}
