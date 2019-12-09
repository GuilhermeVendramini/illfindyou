// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterController, Store {
  final _$registerStateAtom = Atom(name: '_RegisterController.registerState');

  @override
  RegisterState get registerState {
    _$registerStateAtom.context.enforceReadPolicy(_$registerStateAtom);
    _$registerStateAtom.reportObserved();
    return super.registerState;
  }

  @override
  set registerState(RegisterState value) {
    _$registerStateAtom.context.conditionallyRunInAction(() {
      super.registerState = value;
      _$registerStateAtom.reportChanged();
    }, _$registerStateAtom, name: '${_$registerStateAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_RegisterController.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$messageAtom = Atom(name: '_RegisterController.message');

  @override
  String get message {
    _$messageAtom.context.enforceReadPolicy(_$messageAtom);
    _$messageAtom.reportObserved();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.context.conditionallyRunInAction(() {
      super.message = value;
      _$messageAtom.reportChanged();
    }, _$messageAtom, name: '${_$messageAtom.name}_set');
  }

  final _$saveRegisterFormAsyncAction = AsyncAction('saveRegisterForm');

  @override
  Future<RegisterState> saveRegisterForm() {
    return _$saveRegisterFormAsyncAction.run(() => super.saveRegisterForm());
  }

  final _$_RegisterControllerActionController =
      ActionController(name: '_RegisterController');

  @override
  dynamic saveFieldPassword(String value) {
    final _$actionInfo = _$_RegisterControllerActionController.startAction();
    try {
      return super.saveFieldPassword(value);
    } finally {
      _$_RegisterControllerActionController.endAction(_$actionInfo);
    }
  }
}
