import 'dart:async';

import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/api/login_api.dart';
import 'package:mobx/mobx.dart';

part 'login_model.g.dart';

class LoginModel = LoginModelBase with _$LoginModel;

abstract class LoginModelBase with Store {

  @observable
  bool showProgress = false;

  @observable
  Exception? error;

  @action
  login(String companyCpfCnpj, String code, String password) async {
    try {
      showProgress = true;

      ApiResponse response = await LoginApi.login(companyCpfCnpj, code, password);

      showProgress = false;

      return response;

    } catch (e) {
      error = Exception(e);
    }
  }

}
