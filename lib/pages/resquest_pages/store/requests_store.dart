import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../entities/solicitation_entity.dart';
import '../../../external/error/error_api.dart';
import '../../../external/services/solicitation_requests_api.dart';

part 'requests_store.g.dart';

class RequestsStore = RequestsStoreBase with _$RequestsStore;

abstract class RequestsStoreBase with Store {
  @observable
  var listSolicitationEntity = ObservableList<SolicitationEntity>();

  @observable
  Exception? error;

  @observable
  bool loading = false;

  @action
  void fetch() {}

  @action
  Future<void> getSolicitationRequest(bool pending) async {
    listSolicitationEntity.clear();
    try {
      loading = true;
      var result = await SolicitationRequestApi.getSolicitationRequestOperator(pending);
      if (result.length > 0) {
        listSolicitationEntity.addAll(result);
      }
      loading = false;
    } on ApiException catch (e) {
      loading = false;
      log('${e.message} ${e.stackTrace}');
    }
  }

  @action
  Future<void> updateSolicitation(int id, bool authorized, String requestedDescription) async {
    try {
      var result = await SolicitationRequestApi.putSolicitation(id, authorized, requestedDescription);
      if (result) {
        getSolicitationRequest(true);
      }
    } on ApiException catch (e) {
      log('${e.message} ${e.stackTrace}');
    }
  }
}
