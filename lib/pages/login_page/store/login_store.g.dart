// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on LoginStoreBase, Store {
  final _$showProgressAtom = Atom(name: 'LoginStoreBase.showProgress');

  @override
  bool get showProgress {
    _$showProgressAtom.reportRead();
    return super.showProgress;
  }

  @override
  set showProgress(bool value) {
    _$showProgressAtom.reportWrite(value, super.showProgress, () {
      super.showProgress = value;
    });
  }

  final _$errorAtom = Atom(name: 'LoginStoreBase.error');

  @override
  Exception? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$hidePasswordAtom = Atom(name: 'LoginStoreBase.hidePassword');

  @override
  bool get hidePassword {
    _$hidePasswordAtom.reportRead();
    return super.hidePassword;
  }

  @override
  set hidePassword(bool value) {
    _$hidePasswordAtom.reportWrite(value, super.hidePassword, () {
      super.hidePassword = value;
    });
  }

  final _$rememberMeAtom = Atom(name: 'LoginStoreBase.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportRead();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.reportWrite(value, super.rememberMe, () {
      super.rememberMe = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('LoginStoreBase.login');

  @override
  Future<String?> login(String username, String password) {
    return _$loginAsyncAction.run(() => super.login(username, password));
  }

  final _$LoginStoreBaseActionController =
      ActionController(name: 'LoginStoreBase');

  @override
  void changeShowPassword() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.changeShowPassword');
    try {
      return super.changeShowPassword();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeRemember() {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.changeRemember');
    try {
      return super.changeRemember();
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRemember(bool remember) {
    final _$actionInfo = _$LoginStoreBaseActionController.startAction(
        name: 'LoginStoreBase.setRemember');
    try {
      return super.setRemember(remember);
    } finally {
      _$LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showProgress: ${showProgress},
error: ${error},
hidePassword: ${hidePassword},
rememberMe: ${rememberMe}
    ''';
  }
}
