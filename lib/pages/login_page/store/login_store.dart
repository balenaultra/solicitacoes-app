import 'dart:async';

import 'package:solicitacoes_app/external/services/login_api.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  @observable
  bool showProgress = false;

  @observable
  Exception? error;

  @observable
  bool hidePassword = true;

  @observable
  bool rememberMe = false;

  @action
  Future<String?> login(String username, String password) async {
    showProgress = true;
    String token = await LoginApi.login(username, password);
    showProgress = false;
    return token;
  }

  @action
  void changeShowPassword() {
    hidePassword = !hidePassword;
  }

  @action
  void changeRemember() {
    rememberMe = !rememberMe;
  }

  @action
  void setRemember(bool remember) {
    rememberMe = remember;
  }
}
