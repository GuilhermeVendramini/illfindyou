import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:illfindyou/src/shared/widgets/components/missing_list.dart';
import 'package:provider/provider.dart';

class MissingListBlock extends StatefulWidget {
  @override
  _MissingListBlockState createState() => _MissingListBlockState();
}

class _MissingListBlockState extends State<MissingListBlock>
    with TickerProviderStateMixin {
  Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<HomeController>(context);
    _controller.animationController =
        AnimationController(duration: const Duration(seconds: 3), vsync: this);
    _animation = CurvedAnimation(
        parent: _controller.animationController, curve: Curves.easeIn);

    if (_controller.missingState == MissingState.SUCCESS) {
      _controller.animationController.forward();
    }

    return Observer(
      builder: (_) {
        switch (_controller.missingState) {
          case MissingState.LOADING:
            return CircularProgressIndicator();
            break;
          case MissingState.SUCCESS:
            if (_controller.missingList != null &&
                _controller.missingList.isNotEmpty) {
              final String _messageFoundMissing =
                  _controller.missingList.length > 1
                      ? Strings.homeFoundMissing
                      : Strings.homeFoundOneMissing;
              return FadeTransition(
                opacity: _animation,
                child: Column(
                  children: <Widget>[
                    Text(
                      _messageFoundMissing,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      height: 280.0,
                      child: MissingList(),
                    ),
                  ],
                ),
              );
            } else {
              return Text('No results');
            }
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
