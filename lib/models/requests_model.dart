import 'dart:async';

import 'package:solicitacoes_app/api/login_api.dart';
import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/datas/request_data.dart';
import 'package:solicitacoes_app/api/request_api.dart';
import 'package:mobx/mobx.dart';

part 'requests_model.g.dart';

class RequestsModel = RequestsModelBase with _$RequestsModel;

abstract class RequestsModelBase with Store {

  @observable
  List<Request>? requestList = [];

  @observable
  Exception? error;

  @action
  fetch({DateTime? date}) async {
    try {
      var user = await Usuario.get();

      if (user != null) {
        DateTime now =  DateTime.now();
        now = DateTime(now.year, now.month, now.day);

        if (now != user.tokenDate) {
          ApiResponse responseLogin = await LoginApi.login(
              user.companyCPFCNPJ, user.code.toString(), user.password);

          if (!responseLogin.ok)
            throw Exception(responseLogin.msg);
        }
      }

      ApiResponse response = await RequestApi.fetch(date: date);

      if (response.ok)
        requestList = response.result;
      else
        throw Exception(response.msg);

      return response;

    } catch (e) {
      error = Exception(e);
    }
  }

}
