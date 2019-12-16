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
        image: DecorationImage(
          image: CachedNetworkImageProvider(missing.images[0]),
          fit: BoxFit.cover,
        ),
      ),
      width: 200.0,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.black.withOpacity(0.8),
          onTap: () {
            print('tap');
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
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
            ],
          ),
        ),
      ),
    );
  }
}
