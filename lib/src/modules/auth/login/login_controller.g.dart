// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$startedAnimationAtom =
      Atom(name: '_LoginController.startedAnimation');

  @override
  bool get startedAnimation {
    _$startedAnimationAtom.context.enforceReadPolicy(_$startedAnimationAtom);
    _$startedAnimationAtom.reportObserved();
    return super.startedAnimation;
  }

  @override
  set startedAnimation(bool value) {
    _$startedAnimationAtom.context.conditionallyRunInAction(() {
      super.startedAnimation = value;
      _$startedAnimationAtom.reportChanged();
    }, _$startedAnimationAtom, name: '${_$startedAnimationAtom.name}_set');
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  void _startAnimation() {
    final _$actionInfo = _$_LoginControllerActionController.startAction();
    try {
      return super._startAnimation();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }
}
