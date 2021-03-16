// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestsModel on RequestsModelBase, Store {
  final _$requestListAtom = Atom(name: 'RequestsModelBase.requestList');

  @override
  List<Request> get requestList {
    _$requestListAtom.reportRead();
    return super.requestList;
  }

  @override
  set requestList(List<Request> value) {
    _$requestListAtom.reportWrite(value, super.requestList, () {
      super.requestList = value;
    });
  }

  final _$errorAtom = Atom(name: 'RequestsModelBase.error');

  @override
  Exception get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Exception value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('RequestsModelBase.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
requestList: ${requestList},
error: ${error}
    ''';
  }
}
