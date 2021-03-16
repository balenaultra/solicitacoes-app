import 'dart:async';

import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:mobx/mobx.dart';

part 'requests_model.g.dart';

class RequestsModel = RequestsModelBase with _$RequestsModel;

abstract class RequestsModelBase with Store {

  @observable
  List<Request> requestList = [];

  @observable
  Exception error;

  @action
  fetch() async {
    try {
      ApiResponse response = await RequestApi.fetch();

      if (response.ok)
        requestList = response.result;
      else
        throw Exception(response.msg);

      return response;

    } catch (e) {
      error = e;
    }
  }

}
