import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:illfindyou/src/modules/missing/missing_controller.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';
import 'package:provider/provider.dart';

class DefaultCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<MissingController>(context);

    return Observer(
      builder: (_) {
        switch (_controller.imagesState) {
          case ImagesState.IDLE:
          case ImagesState.LOADING:
            return CircularProgressIndicator();
            break;
          case ImagesState.DONE:
            if (_controller.images.isNotEmpty) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 400.0,
                child: PageView.builder(
                  controller: PageController(
                      viewportFraction: 0.8,
                      initialPage: _controller.images.length - 1),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: DefaultColors.white),
                        color: Colors.white,
                      ),
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl: _controller.images[index],
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            Image.asset('assets/images/background01.jpg'),
                      ),
                    );
                  },
                  itemCount: _controller.images.length, // Can be null
                ),
              );
            }
            return Container();
          default:
            return Container();
            break;
        }
      },
    );
  }
}
