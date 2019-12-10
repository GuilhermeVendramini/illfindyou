// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$loginStateAtom = Atom(name: '_LoginController.loginState');

  @override
  LoginState get loginState {
    _$loginStateAtom.context.enforceReadPolicy(_$loginStateAtom);
    _$loginStateAtom.reportObserved();
    return super.loginState;
  }

  @override
  set loginState(LoginState value) {
    _$loginStateAtom.context.conditionallyRunInAction(() {
      super.loginState = value;
      _$loginStateAtom.reportChanged();
    }, _$loginStateAtom, name: '${_$loginStateAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginController.password');

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

  final _$saveLoginFormAsyncAction = AsyncAction('saveLoginForm');

  @override
  Future<LoginState> saveLoginForm() {
    return _$saveLoginFormAsyncAction.run(() => super.saveLoginForm());
  }
}
