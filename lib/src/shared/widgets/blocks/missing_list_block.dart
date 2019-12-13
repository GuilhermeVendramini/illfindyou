import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/home/home_controller.dart';
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

    _controller.animationController.forward();

    return Observer(
      builder: (_) {
        switch (_controller.missingState) {
          case MissingState.LOADING:
            return CircularProgressIndicator();
            break;
          case MissingState.SUCCESS:
            return _controller.missingList != null &&
                    _controller.missingList.isNotEmpty
                ? FadeTransition(
                    opacity: _animation,
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Can be one of them',
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
