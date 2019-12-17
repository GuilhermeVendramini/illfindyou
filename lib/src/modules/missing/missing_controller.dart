import 'package:flutter/foundation.dart';
import 'package:illfindyou/src/models/missing_model.dart';
import 'package:illfindyou/src/services/missing_service.dart';
import 'package:mobx/mobx.dart';

part 'missing_controller.g.dart';

class MissingController = _MissingController with _$MissingController;

enum ImagesState { LOADING, DONE, IDLE }

abstract class _MissingController with Store {
  final MissingModel missing;

  _MissingController({@required this.missing}) {
    getMissingImages();
  }

  final MissingService _missingService = MissingService();

  @observable
  ImagesState imagesState = ImagesState.IDLE;

  List<String> images = [];

  @action
  getMissingImages() async {
    imagesState = ImagesState.LOADING;
    List<dynamic> _images = missing.images.toList();

    if (_images.length > 1) {
      images.add(_images[0]);
      _images.removeAt(0);
      _images.forEach((image) async {
        try {
          final String _imagePath =
              await _missingService.getMissingImagePath(image: image);

          if (_imagePath != null) {
            images.add(_imagePath);
          }
          imagesState = ImagesState.DONE;
        } catch (e) {
          imagesState = ImagesState.DONE;
          print('missing_controller - getMissingDetails(): $e');
        }
      });
    } else {
      images.add(_images[0]);
      imagesState = ImagesState.DONE;
    }
  }
}
