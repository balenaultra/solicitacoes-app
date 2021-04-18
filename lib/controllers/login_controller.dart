import 'dart:async';

import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/api/login_api.dart';
import 'package:solicitacoes_app/datas/usuario_data.dart';

class LoginController{
  Future<ApiResponse<Usuario>> login(String companyCpfCnpj, String code, String password) async {

    ApiResponse response = await LoginApi.login(companyCpfCnpj, code, password);

    return response as FutureOr<ApiResponse<Usuario>>;
  }
}