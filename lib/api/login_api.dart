import 'dart:convert';

import 'package:solicitacoes_app/utils/api_response.dart';
import 'package:solicitacoes_app/datas/usuario_data.dart';
import 'package:solicitacoes_app/utils/http_helper.dart' as http;

class LoginApi {
  static Future<ApiResponse<Usuario>> login(String companyCPFCNPJ, String code, String password) async {
    try {
      var url = 'http://localhost:3000/users/authenticate';

      final params = {
        "company_cpf_cnpj": companyCPFCNPJ,
        "code": code,
        "password": password};
      String s = json.encode(params);

      var response = await http.post(url, body: s);

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse["user"]);
        user.token = mapResponse["token"];

        user.save();

        return ApiResponse.ok(user);
      }
      return ApiResponse.error(mapResponse["error"]);
    } catch (error) {
      print("Erro no login $error");

      return ApiResponse.error("Não foi possível fazer o login.");
    }
  }
}
