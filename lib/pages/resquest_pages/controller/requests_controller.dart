import 'package:flutter/material.dart';

import '../../../entities/solicitation_entity.dart';
import '../store/requests_store.dart';

class ResquestsController {
  final dscSolicitor = TextEditingController();
  final RequestsStore requestsStore = RequestsStore();

  Map<int, dynamic> requestedObservation = {};

  void acceptRequests(SolicitationEntity solicitationEntity) {
    requestsStore.updateSolicitation(
        solicitationEntity.id!, true, requestedObservation[solicitationEntity.id] ?? "");
  }

  void rejectRequests(SolicitationEntity solicitationEntity) {
    requestsStore.updateSolicitation(
        solicitationEntity.id!, false, requestedObservation[solicitationEntity.id] ?? "");
  }

  void changeRequestedDescription(SolicitationEntity solicitationEntity, String value) {
    requestedObservation[solicitationEntity.id!] = value;
  }
}
