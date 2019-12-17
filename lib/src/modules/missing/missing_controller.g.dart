// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'missing_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MissingController on _MissingController, Store {
  final _$imagesStateAtom = Atom(name: '_MissingController.imagesState');

  @override
  ImagesState get imagesState {
    _$imagesStateAtom.context.enforceReadPolicy(_$imagesStateAtom);
    _$imagesStateAtom.reportObserved();
    return super.imagesState;
  }

  @override
  set imagesState(ImagesState value) {
    _$imagesStateAtom.context.conditionallyRunInAction(() {
      super.imagesState = value;
      _$imagesStateAtom.reportChanged();
    }, _$imagesStateAtom, name: '${_$imagesStateAtom.name}_set');
  }

  final _$getMissingImagesAsyncAction = AsyncAction('getMissingImages');

  @override
  Future getMissingImages() {
    return _$getMissingImagesAsyncAction.run(() => super.getMissingImages());
  }
}
