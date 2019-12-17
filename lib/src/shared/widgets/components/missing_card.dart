import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:illfindyou/src/models/missing_model.dart';
import 'package:illfindyou/src/shared/colors/default_colors.dart';

class MissingCard extends StatelessWidget {
  final MissingModel missing;

  MissingCard({@required this.missing});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 4.0,
          color: DefaultColors.white,
        ),
      ),
      width: 200.0,
      height: 280.0,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: CachedNetworkImage(
              imageUrl: missing.images[0],
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/background01.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40.0,
              width: double.maxFinite,
              color: DefaultColors.white.withOpacity(0.8),
              padding: EdgeInsets.all(10.0),
              alignment: Alignment.center,
              child: Text(
                missing.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: DefaultColors.black,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Material(
            color: DefaultColors.transparent,
            child: InkWell(
              splashColor: DefaultColors.black.withOpacity(0.8),
              onTap: () {
                print('tap');
              },
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
