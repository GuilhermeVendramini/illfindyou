import 'dart:io';

import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:illfindyou/src/shared/i18n/en-US.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

enum PickImageState { LOADING, SUCCESS, FAIL, IDLE }

abstract class _HomeController with Store {
  final ImageLabeler _imageLabeler = FirebaseVision.instance.imageLabeler();

  @observable
  File imageFile;

  @observable
  PickImageState pickImageState = PickImageState.IDLE;

  @observable
  List<ImageLabel> scanResults;

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
      scanResults = null;

      final FirebaseVisionImage visionImage =
          FirebaseVisionImage.fromFile(imageFile);

      scanResults = await _imageLabeler.processImage(visionImage);

      scanResults.forEach((data) {
        print(data.text);
      });
    } catch (e) {
      print('home_controller - _scanImage(): $e');
    }
  }
}
