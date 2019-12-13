import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum PickImageState { LOADING, SUCCESS, FAIL, IDLE }

abstract class _HomeController with Store {
  @observable
  File imageFile;

  @observable
  PickImageState pickImageState = PickImageState.IDLE;

  @observable
  List<VisionEdgeImageLabel> scanResults;

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
        _scanImage(imageFile);
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

  Future<void> _scanImage(File imageFile) async {
    try {
      final VisionEdgeImageLabeler _visionEdgeImageLabeler = FirebaseVision.instance
          .visionEdgeImageLabeler('person', ModelLocation.Local);
      scanResults = null;

      final FirebaseVisionImage _visionImage =
          FirebaseVisionImage.fromFile(imageFile);

      scanResults = await _visionEdgeImageLabeler.processImage(_visionImage);

      scanResults.forEach((data) {
        print(data.text);
      });
      _visionEdgeImageLabeler.close();
    } catch (e) {
      print('home_controller - _scanImage(): $e');
    }
  }
}
