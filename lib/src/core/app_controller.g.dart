// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppController, Store {
  final _$startedAnimationAtom = Atom(name: '_AppController.startedAnimation');

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

  final _$userAtom = Atom(name: '_AppController.user');

  @override
  FirebaseUser get user {
    _$userAtom.context.enforceReadPolicy(_$userAtom);
    _$userAtom.reportObserved();
    return super.user;
  }

  @override
  set user(FirebaseUser value) {
    _$userAtom.context.conditionallyRunInAction(() {
      super.user = value;
      _$userAtom.reportChanged();
    }, _$userAtom, name: '${_$userAtom.name}_set');
  }

  final _$currentUserVerifiedAtom =
      Atom(name: '_AppController.currentUserVerified');

  @override
  bool get currentUserVerified {
    _$currentUserVerifiedAtom.context
        .enforceReadPolicy(_$currentUserVerifiedAtom);
    _$currentUserVerifiedAtom.reportObserved();
    return super.currentUserVerified;
  }

  @override
  set currentUserVerified(bool value) {
    _$currentUserVerifiedAtom.context.conditionallyRunInAction(() {
      super.currentUserVerified = value;
      _$currentUserVerifiedAtom.reportChanged();
    }, _$currentUserVerifiedAtom,
        name: '${_$currentUserVerifiedAtom.name}_set');
  }

  final _$_loadCurrentUserAsyncAction = AsyncAction('_loadCurrentUser');

  @override
  Future<Null> _loadCurrentUser() {
    return _$_loadCurrentUserAsyncAction.run(() => super._loadCurrentUser());
  }

  final _$_AppControllerActionController =
      ActionController(name: '_AppController');

  @override
  void _startAnimation() {
    final _$actionInfo = _$_AppControllerActionController.startAction();
    try {
      return super._startAnimation();
    } finally {
      _$_AppControllerActionController.endAction(_$actionInfo);
    }
  }
}
