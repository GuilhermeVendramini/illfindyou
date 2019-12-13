import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:illfindyou/src/models/missing_model.dart';
import 'package:illfindyou/src/services/missing_service.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum PickImageState { LOADING, SUCCESS, FAIL, IDLE }
enum MissingState { LOADING, SUCCESS, FAIL, IDLE }

abstract class _HomeController with Store {
  @observable
  File imageFile;

  @observable
  PickImageState pickImageState = PickImageState.IDLE;

  @observable
  MissingState missingState = MissingState.IDLE;

  @observable
  List<VisionEdgeImageLabel> scanResults;

  final VisionEdgeImageLabeler _visionEdgeImageLabeler =
      FirebaseVision.instance.visionEdgeImageLabeler(
    'person',
    ModelLocation.Local,
    VisionEdgeImageLabelerOptions(
      confidenceThreshold: 0.7,
    ),
  );

  final MissingService _missingService = MissingService();

  @observable
  List<MissingModel> missingList = [];

  String message;

  @action
  Future<PickImageState> getAndScanImage() async {
    try {
      message = '';
      pickImageState = PickImageState.LOADING;

      imageFile = await ImagePicker.pickImage(source: ImageSource.gallery)
          .whenComplete(() {
        pickImageState = PickImageState.IDLE;
      });

      if (imageFile != null) {
        pickImageState = PickImageState.SUCCESS;
        _searchMissing(imageFile);
        return PickImageState.SUCCESS;
      }

      return PickImageState.IDLE;
    } catch (e) {
      message = Strings.homeErrorMessagePickerImage;
      pickImageState = PickImageState.FAIL;
      print('home_controller - getAndScanImage(): $e');
      return PickImageState.FAIL;
    }
  }

  @action
  Future<void> _searchMissing(File imageFile) async {
    try {
      missingState = MissingState.LOADING;
      scanResults = null;
      missingList = [];

      final FirebaseVisionImage _visionImage =
          FirebaseVisionImage.fromFile(imageFile);

      scanResults = await _visionEdgeImageLabeler.processImage(_visionImage);

      scanResults.forEach((data) async {
        final MissingModel _missing =
            await _missingService.getMissing(label: data.text);
        if (_missing != null) {
          missingList.add(_missing);
        }
        missingState = MissingState.SUCCESS;
      });
      missingState = MissingState.SUCCESS;
    } catch (e) {
      missingState = MissingState.FAIL;
      print('home_controller - _scanImage(): $e');
    }
  }

  @override
  void dispose() {
    _visionEdgeImageLabeler.close();
  }
}
