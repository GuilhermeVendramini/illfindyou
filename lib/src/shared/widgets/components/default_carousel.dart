import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
            return Container(
              alignment: Alignment.center,
              height: 400.0,
              child: CircularProgressIndicator(),
            );
            break;
          case ImagesState.DONE:
            if (_controller.images.isNotEmpty) {
              return CarouselSlider(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                items: _controller.images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: DefaultColors.white),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          imageUrl: image,
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
                  );
                }).toList(),
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
