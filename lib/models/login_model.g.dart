// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginModel on LoginModelBase, Store {
  final _$showProgressAtom = Atom(name: 'LoginModelBase.showProgress');

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

  final _$errorAtom = Atom(name: 'LoginModelBase.error');

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

  final _$loginAsyncAction = AsyncAction('LoginModelBase.login');

  @override
  Future login(String companyCpfCnpj, String code, String password) {
    return _$loginAsyncAction
        .run(() => super.login(companyCpfCnpj, code, password));
  }

  @override
  String toString() {
    return '''
showProgress: ${showProgress},
error: ${error}
    ''';
  }
}
