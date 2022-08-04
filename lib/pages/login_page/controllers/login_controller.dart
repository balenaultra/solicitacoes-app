import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:solicitacoes_app/pages/login_page/page/login_page.dart';

import '../../../entities/endpoint_entity.dart';
import '../../../external/services/config_host_api.dart';
import '../../../external/error/error_api.dart';
import '../../../external/middleware/shared_prefs.dart';
import '../../../external/middleware/connection_shared.dart';
import '../../../utils/alert.dart';
import '../../../utils/nav.dart';

import '../../configuration_page/page/conf_page.dart';
import '../../home_page/page/home_page.dart';
import '../store/login_store.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  final loginStore = LoginStore();

  final companyCPFCNPJ = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();

  final focusCode = FocusNode();
  final focusPassword = FocusNode();

  final ConnectionShared requestsShared = ConnectionShared();

  void initValues(String companyCPFCNPJ, String username, String password, bool remenber) {
    this.companyCPFCNPJ.text = companyCPFCNPJ;
    this.username.text = username;
    this.password.text = password;
    loginStore.setRemember(remenber);
  }

  onClickLogin(BuildContext context) async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      EndPointEntity endPointEntity = await ConfigHostApi.getConfigHostApi(companyCPFCNPJ.text);

      if (endPointEntity.host != null && endPointEntity.port != null) {
        requestsShared.setHost(endPointEntity.host!);
        requestsShared.setPort(endPointEntity.port!);
        salveEndpointBase(endPointEntity.host!, endPointEntity.port!);
        showPageConfiguration(context);
      } else {
        alert(context, "Erro ao buscar end point com cnpj...");
      }
    } on ApiException catch (e) {
      log('${e.message} ${e.stackTrace}');

      if (e.message.contains('404')) {
        alert(context, "Status 404 config host...");
      }
      if (e.message.contains('400')) {
        alert(context, "Status 400 config host...");
      }
      if (e.message.contains('401')) {
        alert(context, "Status 401 config host...");
      }
      if (e.message.contains('connectTimeout')) {
        alert(context, "Status connectTimeout config host...");
      }
      if (e.message.contains('Connection failed')) {
        alert(context, "Não foi possivel conectar verificar internet");
      }
      if (e.message.contains("Instance of 'LoginException'")) {
        alert(context, "Não encontrado host e port");
      }
    }
  }

  confirmLogin(BuildContext context) async {
    if (username.text != "" && password.text != "") {
      try {
        String? token = await loginStore.login(username.text, password.text);
        if (token != null) {
          requestsShared.setToken(token);
          salveRemenberLocal(token);
          push(context, HomePage());
        } else {
          alert(context, "Erro ao fazer login...");
        }
      } on ApiException catch (e) {
        log('${e.message} ${e.stackTrace}');

        if (e.message.contains('404')) {
          alert(context, "Status 404 login...");
        }
        if (e.message.contains('400')) {
          alert(context, "Status 400 config login...");
        }
        if (e.message.contains('401')) {
          push(
              context,
              LoginPage(
                  companyCPFCNPJ: companyCPFCNPJ.text,
                  username: username.text,
                  password: password.text,
                  remember: loginStore.rememberMe));
          alert(context, "Login ou senha incorreta verifique...");
        }
        if (e.message.contains('connectTimeout')) {
          alert(context, "Status connectTimeout config login...");
        }
        if (e.message.contains('Connection failed')) {
          alert(context, "Não foi possivel conectar verificar internet");
        }
      }
    }
  }

  void salveRemenberLocal(String token) {
    SharedPref.setString("companyCPFCNPJ", companyCPFCNPJ.text);
    SharedPref.setString("username", username.text);
    SharedPref.setString("password", password.text);
    SharedPref.setBool("remember", loginStore.rememberMe);
    SharedPref.setString("token", token);
  }

  void salveEndpointBase(String host, String port) {
    SharedPref.setString("host", host);
    SharedPref.setString("port", port);
  }

  void showPageConfiguration(BuildContext context) {
    push(context,
        ConfigPage(host: requestsShared.getHost(), port: requestsShared.getPort(), loginController: this));
  }

  String? validateLogin(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite o Texto";
    }
    return null;
  }

  String? validateSenha(String? text) {
    if (text == null || text.isEmpty) {
      return "Digite a Senha";
    }

    if (text.length < 3) {
      return "A senha deve ter ao menos 3 dígitos";
    }

    return null;
  }
}
