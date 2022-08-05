// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RequestsStore on RequestsStoreBase, Store {
  final _$listSolicitationEntityAtom =
      Atom(name: 'RequestsStoreBase.listSolicitationEntity');

  @override
  ObservableList<SolicitationEntity> get listSolicitationEntity {
    _$listSolicitationEntityAtom.reportRead();
    return super.listSolicitationEntity;
  }

  @override
  set listSolicitationEntity(ObservableList<SolicitationEntity> value) {
    _$listSolicitationEntityAtom
        .reportWrite(value, super.listSolicitationEntity, () {
      super.listSolicitationEntity = value;
    });
  }

  final _$errorAtom = Atom(name: 'RequestsStoreBase.error');

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

  final _$loadingAtom = Atom(name: 'RequestsStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getSolicitationRequestAsyncAction =
      AsyncAction('RequestsStoreBase.getSolicitationRequest');

  @override
  Future<void> getSolicitationRequest(bool pending) {
    return _$getSolicitationRequestAsyncAction
        .run(() => super.getSolicitationRequest(pending));
  }

  final _$updateSolicitationAsyncAction =
      AsyncAction('RequestsStoreBase.updateSolicitation');

  @override
  Future<void> updateSolicitation(
      int id, bool authorized, String requestedDescription) {
    return _$updateSolicitationAsyncAction.run(
        () => super.updateSolicitation(id, authorized, requestedDescription));
  }

  final _$RequestsStoreBaseActionController =
      ActionController(name: 'RequestsStoreBase');

  @override
  void fetch() {
    final _$actionInfo = _$RequestsStoreBaseActionController.startAction(
        name: 'RequestsStoreBase.fetch');
    try {
      return super.fetch();
    } finally {
      _$RequestsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listSolicitationEntity: ${listSolicitationEntity},
error: ${error},
loading: ${loading}
    ''';
  }
}
